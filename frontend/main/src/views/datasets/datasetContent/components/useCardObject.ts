import { reactive, ref, watchEffect, watch, computed } from 'vue';
import { transformToPc, mapLinear, focusTransform } from '/@/utils/annotation';
import {
  datasetTypeEnum,
  DatasetListItem,
  DatasetItem,
  fileItem,
} from '/@/api/business/model/datasetModel';
import placeImg from '/@/assets/images/dataset/fusion-banner-content.png';
import placeImgFull from '/@/assets/images/dataset/basic-banner-content.png';
import { Vector2, Matrix3 } from 'three';
import { debounce } from 'lodash-es';

export enum I2D_TYPE {
  POLYGON = 'POLYGON',
  RECTANGLE = 'RECTANGLE',
  POLYLINE = 'POLYLINE',
}

const AnnotationTypeMap = {
  '2D_RECT': '2D_RECT',
  '2D_BOX': '2D_BOX',
  '3D_BOX': '3D_BOX',
  '3d': '3D_BOX',
  rect: '2D_RECT',
  box2d: '2D_BOX',
  POLYGON: 'POLYGON',
  RECTANGLE: 'RECTANGLE',
  POLYLINE: 'POLYLINE',
};

export default function useCardObject() {
  const svg = ref(null);
  const refs = ref({});
  const iState = reactive({
    pcObject: [] as any[],
    pcImageObject: [] as any[],
    imageObject: [] as any[],
  });
  const size = ref({
    init: false,
    width: 0,
    height: 0,
    svgWidth: 0,
    svgHeight: 0,
  });
  const setRef = (e: any, key: any) => {
    refs.value[key] = e;
  };
  const getRef = (key: any) => {
    return refs.value[key];
  };
  const getSize = (element: SVGElement | null | undefined) => {
    const size = {
      width: 0,
      height: 0,
    };
    if (element) {
      size.width = element.clientWidth;
      size.height = element.clientHeight;
    }
    return size;
  };
  const getImageUrl = (item: any) => {
    const info = item.content && item.content[0]?.file?.extraInfo;
    const url = item.content && item.content[0]?.file?.url;
    const mediumUrl = item.content && item.content[0]?.file?.mediumThumbnail?.url;
    return info ? mediumUrl || url : url;
  };
  const canPreview = (data: any, info: any) => {
    const isPc =
      info?.type === datasetTypeEnum.LIDAR_BASIC || info?.type === datasetTypeEnum.LIDAR_FUSION;
    if (!isPc) return true;
    const pc = data?.content && data?.content.filter((item) => item.name === 'pointCloud')[0];
    const renderImage = pc?.files && pc.files[0].file?.renderImage;
    return renderImage?.url && renderImage?.extraInfo;
  };
  const onImgLoad = (data: any) => {
    const info = data.content && data.content[0]?.file?.extraInfo;
    if (!svg.value) return;
    const imgDom = svg.value as HTMLImageElement;
    const { clientWidth, clientHeight } = imgDom as HTMLImageElement;
    const naturalWidth = info?.width || imgDom.naturalWidth;
    const naturalHeight = info?.height || imgDom.naturalHeight;
    const aspect = naturalWidth / naturalHeight;
    const fitAspect = clientWidth / clientHeight;

    size.value.width = naturalWidth;
    size.value.height = naturalHeight;
    if (aspect > fitAspect) {
      size.value.svgWidth = clientHeight * aspect;
      size.value.svgHeight = clientHeight;
    } else {
      size.value.svgWidth = clientWidth;
      size.value.svgHeight = clientWidth / aspect;
    }
    size.value.init = true;
  };
  const updatePcResult = (target: any[], objects: any[], info: any) => {
    const size = getSize(svg.value);
    if (info)
      objects.forEach((obj) => {
        const contour = obj.contour || obj;
        const { center3D, rotation3D, size3D } = contour;
        if (center3D && rotation3D && size3D) {
          const { points } = transformToPc(contour, size, info);
          target.push({ id: obj.id, points: points.map((pos) => pos.join(',')).join(' ') });
        }
      });
  };
  const updatePcImageResult = (
    target: any[],
    objects: any[],
    index: number,
    svg: SVGElement,
    imgSize: any,
  ) => {
    // const imgName = img.name
    if (svg && imgSize) {
      const aspect = imgSize.width / imgSize.height;
      const contextNode = svg.parentElement as HTMLDivElement;
      const contextAspect = contextNode.clientWidth / contextNode.clientHeight;
      let width: number;
      let height: number;
      if (aspect > contextAspect) {
        height = contextNode.clientHeight;
        width = aspect * height;
      } else {
        width = contextNode.clientWidth;
        height = width / aspect;
      }
      svg.style.width = width + 'px';
      svg.style.height = height + 'px';
      objects.forEach((item) => {
        const contour = item.contour || item;
        if (contour?.viewIndex !== index) return;
        const type = AnnotationTypeMap[item.type || item.objType];
        if (type === '2D_RECT') {
          let points = contour.points;
          if (points.length === 2) {
            points = [
              { x: points[0].x, y: points[0].y },
              { x: points[0].x, y: points[1].y },
              { x: points[1].x, y: points[1].y },
              { x: points[1].x, y: points[0].y },
            ];
          }
          target.push({
            id: item.id,
            type: type,
            points: points
              .map((point) => {
                return [
                  (point.x * width) / imgSize.width,
                  (point.y * height) / imgSize.height,
                ].join(',');
              })
              .join(' '),
          });
        } else if (type === '2D_BOX') {
          const P = contour.points;
          target.push({
            id: item.id,
            type: type,
            points: [
              P[0],
              P[1],
              P[2],
              P[3],
              P[0],
              P[4],
              P[5],
              P[6],
              P[7],
              P[4],
              P[5],
              P[1],
              P[2],
              P[6],
              P[7],
              P[3],
            ]
              .map((point) => {
                return [
                  (point.x * width) / imgSize.width,
                  (point.y * height) / imgSize.height,
                ].join(',');
              })
              .join(' '),
          });
        }
      });
    }
  };
  const updateImageResult = (objects: any[]) => {
    const getPoints = function getPoints(points: { x: number; y: number }[]) {
      return points
        .map((point) => {
          const points = [
            mapLinear(point.x, 0, size.value.width, 0, size.value.svgWidth),
            mapLinear(point.y, 0, size.value.height, 0, size.value.svgHeight),
          ].join(',');

          return points;
        })
        .join(' ');
    };
    return objects.map((item) => {
      const { contour = {}, id, type, meta = {} } = item;
      const { points = [], interior = [] } = contour;
      let _points: any = [];
      if (type === I2D_TYPE.RECTANGLE) {
        if (points && points.length === 2) {
          const newPoints = points.map((p) => {
            return [
              mapLinear(p.x, 0, size.value.width, 0, size.value.svgWidth),
              mapLinear(p.y, 0, size.value.height, 0, size.value.svgHeight),
            ];
          });
          const rect = [
            [newPoints[0][0], newPoints[0][1]].join(','),
            [newPoints[0][0], newPoints[1][1]].join(','),
            [newPoints[1][0], newPoints[1][1]].join(','),
            [newPoints[1][0], newPoints[0][1]].join(','),
          ];
          _points = rect.join(' ');
        }
      } else if ([I2D_TYPE.POLYGON, I2D_TYPE.POLYLINE].includes(type)) {
        _points = getPoints(points);
      }
      const hole = interior.map((el: any) => {
        const coord = el.coordinate;
        return getPoints(coord);
      });
      return {
        points: _points,
        type: AnnotationTypeMap[type],
        hole,
        color: meta.color,
        uuid: id,
      };
    });
  };
  return {
    iState,
    size,
    svg,
    refs,
    setRef,
    getRef,
    getSize,
    onImgLoad,
    getImageUrl,
    canPreview,
    updatePcResult,
    updatePcImageResult,
    updateImageResult,
  };
}

export function useImgCard(props: {
  info: DatasetListItem | undefined;
  data: DatasetItem;
  showAnnotation?: boolean;
  object?: any;
}) {
  const {
    iState,
    setRef,
    size,
    svg,
    getRef,
    onImgLoad,
    getImageUrl,
    updateImageResult,
    updatePcImageResult,
    updatePcResult,
  } = useCardObject();
  const getExtraInfo = () => {
    const pc = props.data.content
      ? props.data.content.filter((item) => item.name === 'pointCloud')[0]
      : { files: null };
    return pc.files ? pc.files[0].file?.renderImage?.extraInfo : null;
  };
  /**
   * 点云 缩影框
   */
  const updatePcObject = () => {
    const results: { id: string; points: string }[] = [];
    if (
      props.showAnnotation !== false &&
      (props.info?.type === datasetTypeEnum.LIDAR_FUSION ||
        props.info?.type === datasetTypeEnum.LIDAR_BASIC)
    ) {
      const objects = (props.object || []).filter(
        (item) => item.type === '3D_BOX' || item.objType === '3d',
      );
      // let size = getSize(svg.value);
      const info = getExtraInfo();
      updatePcResult(results, objects, info);
    }
    iState.pcObject = results;
  };
  watchEffect(updatePcObject);
  /**
   * 图片 缩影框
   */
  const updateImageObject = () => {
    let results: any[] = [];
    if (
      props.showAnnotation !== false &&
      props.info?.type === datasetTypeEnum.IMAGE &&
      size.value.init
    ) {
      const objects = props.object || [];
      results = updateImageResult(objects);
    }
    iState.imageObject = results;
  };
  watchEffect(updateImageObject);
  /**
   * 点云融合图片缩影框
   */
  const updatePcImageObject = () => {
    const imgs: any[] = props.data.content
      ? props.data.content
          .filter((record) => record?.directoryType?.includes('image'))
          .slice(0, 3)
          .map((img) => {
            return Object.assign({}, img, { object: null });
          })
      : [];
    if (
      props.showAnnotation !== false &&
      props.info?.type === datasetTypeEnum.LIDAR_FUSION &&
      props.data.content
    ) {
      const objects = (props.object || []).filter((item) => {
        const flagNew = ['2D_BOX', '2D_RECT'].includes(item.type);
        const flagOld = ['rect', 'box2d'].includes(item.objType);
        return flagNew || flagOld;
      });
      imgs.forEach((img, index) => {
        const ref = getRef(index) as HTMLDivElement;
        if (!ref) return;
        const imgSize = (img?.files || [])[0]?.file?.extraInfo;

        const svgElement = ref.querySelector('svg.easy-image') as SVGElement;
        if (imgSize) {
          const items: any[] = [];
          updatePcImageResult(items, objects, index, svgElement, imgSize);
          img.object = items;
        }
      });
    }
    iState.pcImageObject = imgs;
  };
  watchEffect(updatePcImageObject);

  const getPcImage = (item: any) => {
    return getUrl(item) || placeImg;
  };
  const getUrl = (item: any) => {
    // const info = (item?.files || [])[0]?.file?.extraInfo;
    const smallUrl = item?.files && item?.files[0]?.file?.smallThumbnail?.url;
    const url = item?.files && item?.files[0]?.file?.url;
    return smallUrl || url;
  };
  const getPlaceImg = () => {
    const placeImgType = props.info?.type === datasetTypeEnum.LIDAR_BASIC ? placeImgFull : placeImg;
    const pc = props.data.content
      ? props.data.content.filter((item) => item.name === 'pointCloud')[0]
      : { files: null };
    const file = pc.files && pc.files[0].file;
    const thumbnailUrl = file?.mediumThumbnail?.url;
    const url = file?.renderImage?.url;
    return thumbnailUrl || url || placeImgType;
  };
  return {
    getPcImage,
    getPlaceImg,
    setRef,
    iState,
    svg,
    size,
    onImgLoad,
    getImageUrl,
  };
}

export function useSearchCard(props: {
  info: DatasetListItem | undefined;
  object: any;
  object2D: any;
  data: DatasetItem;
}) {
  const { iState, svg, getSize } = useCardObject();
  const state = reactive({
    object2d: [] as any[],
    imgTransform: '',
    transform: '',
    imgIndex: 0,
  });
  const cardContainer = ref<HTMLDivElement | null>(null);
  const getPlaceImg = () => {
    const placeImgType = props.info?.type === datasetTypeEnum.LIDAR_BASIC ? placeImgFull : placeImg;
    const pc = props.data
      ? props.data.content.filter((item) => item.name === 'pointCloud')[0]
      : { files: null };
    const file = pc.files && pc.files[0].file;
    const thumbnailUrl = file?.mediumThumbnail?.url;
    const url = file?.renderImage?.url;
    return thumbnailUrl || url || placeImgType;
  };
  const getPcImage = (item: any) => {
    return getUrl(item) || placeImg;
  };
  const getUrl = (item: any) => {
    // const info = (item?.files || [])[0]?.file?.extraInfo;
    const smallUrl = item?.files && item?.files[0]?.file?.smallThumbnail?.url;
    const url = item?.files && item?.files[0]?.file?.url;
    return smallUrl || url;
  };
  const getExtraInfo = () => {
    const pc = props.data
      ? props.data.content.filter((item) => item.name === 'pointCloud')[0]
      : { files: null };
    return pc.files ? pc.files[0].file?.renderImage?.extraInfo : null;
  };
  /**
   * 点云 缩影框
   */
  const updatePcObject = () => {
    const results: { id: string; points: string }[] = [];
    if (
      props.info?.type === datasetTypeEnum.LIDAR_FUSION ||
      props.info?.type === datasetTypeEnum.LIDAR_BASIC
    ) {
      const object = props.object.classAttributes;
      // let size = getSize(svg.value);
      const info = getExtraInfo();

      const size = getSize(svg.value);
      if (info && object) {
        const contour = object.contour || object;
        const { center3D, rotation3D, size3D } = contour;
        if (center3D && rotation3D && size3D) {
          const { center, points } = transformToPc(contour, size, info);
          const { matrix3Str, scale } = focusTransform(contour, size, info);

          // results.push({ id: obj.id, points: points.map((pos) => pos.join(',')).join(' ') });

          state.imgTransform = matrix3Str;

          const cX = size.width / 2;
          const cY = size.height / 2;
          const vec2 = new Vector2();
          const _center = new Vector2(cX, cY);
          const rotation3D = contour.rotation3D;
          const _points = points.map((p) => {
            return vec2
              .fromArray([(p[0] - center[0]) * scale + cX, (p[1] - center[1]) * scale + cY])
              .rotateAround(_center, Math.PI / 2 + rotation3D.z)
              .toArray();
          });
          results.push({
            id: contour.id,
            points: _points.map((pos) => pos.join(',')).join(' '),
          });
        }
      }
    }
    iState.pcObject = results;
  };
  watchEffect(updatePcObject);

  const pcActiveImage = computed(() => {
    let file: fileItem | undefined;
    if (props.info?.type === datasetTypeEnum.LIDAR_FUSION) {
      const imgs = props.data?.content.filter(
        (content) => content.directoryType && content.directoryType.includes('image'),
      );
      const img = imgs.length ? imgs[state.imgIndex] : null;
      file = img?.files && img?.files[0]?.file;
    } else if (props.info?.type === datasetTypeEnum.IMAGE) {
      file = props.data?.content && props.data?.content[0]?.file;
    }
    if (file) {
      const extraInfo = file?.extraInfo;
      const url = file?.url;
      const smallUrl = file?.largeThumbnail?.url;
      return {
        extraInfo: extraInfo,
        url: extraInfo ? smallUrl || url : url,
      };
    }
    return {
      url: '',
    };
  });

  const update2d = debounce(() => {
    if (props.info?.type !== datasetTypeEnum.LIDAR_FUSION) return;
    const dom = cardContainer.value as HTMLDivElement;
    if (!dom) return;
    const img = dom.querySelector('img.img-2d') as HTMLImageElement;
    const svg = dom.querySelector('svg.easy-svg') as SVGElement;
    const trackId = props.object.classAttributes.trackId;
    const objects = props.object2D[trackId];
    state.transform = '';
    const object2d: any[] = [];
    if (img.src && img.complete && objects?.length) {
      const imgIndex = state.imgIndex;
      const { naturalWidth, naturalHeight, clientWidth, clientHeight } = updateDom(img, svg);
      const focusItem = (os: any[]) => {
        if (!os.length) return;

        const imgToView_X = (x: number) => {
          return (x / naturalWidth) * clientWidth;
        };
        const imgToView_Y = (y: number) => {
          return (y / naturalHeight) * clientHeight;
        };

        const getOffsetAndScale = (instance: any) => {
          const min = new Vector2(Infinity, Infinity);
          const max = new Vector2(-Infinity, -Infinity);
          let offsetX = 0;
          let offsetY = 0;
          let scale = 1;
          const info = instance.classAttributes;
          const contour = info.contour || info;
          contour.points.forEach((p) => {
            min.min(p);
            max.max(p);
          });
          offsetX = (clientWidth - imgToView_X(min.x + max.x)) / 2;
          offsetY = (clientHeight - imgToView_Y(min.y + max.y)) / 2;
          scale = Math.min(
            clientWidth / imgToView_X(max.x - min.x),
            clientHeight / imgToView_Y(max.y - min.y),
          );
          return {
            offsetX,
            offsetY,
            scale: scale * 0.4,
          };
        };
        const { offsetX, offsetY, scale } = getOffsetAndScale(os[0]);

        os.forEach((o) => {
          let points: any[] = [];
          const info = o.classAttributes;
          const type = info.type || info.objType;
          const contour = info.contour || info;
          const cX = clientWidth / 2;
          const cY = clientHeight / 2;
          if (['2D_BOX', 'box2d'].includes(type)) {
            // const { positions1, positions2 } = o;
            const P = contour.points.map((p) => {
              const _x = cX - (cX - imgToView_X(p.x) - offsetX) * scale;
              const _y = cY - (cY - imgToView_Y(p.y) - offsetY) * scale;
              return [_x, _y];
            });
            points = [
              P[0],
              P[1],
              P[2],
              P[3],
              P[0],
              P[4],
              P[5],
              P[6],
              P[7],
              P[4],
              P[5],
              P[1],
              P[2],
              P[6],
              P[7],
              P[3],
            ];
          } else if (['2D_RECT', 'rect'].includes(type)) {
            let _points = contour.points;
            if (_points.length === 2) {
              _points = [
                { x: _points[0].x, y: _points[0].y },
                { x: _points[0].x, y: _points[1].y },
                { x: _points[1].x, y: _points[1].y },
                { x: _points[1].x, y: _points[0].y },
              ];
            }
            points = _points.map((p) => {
              const _x = cX - (cX - imgToView_X(p.x) - offsetX) * scale;
              const _y = cY - (cY - imgToView_Y(p.y) - offsetY) * scale;
              return [_x, _y];
            });
          }

          if (points.length) {
            object2d.push({
              id: o.uuid,
              points: points.map((p) => p.join(',')).join(' '),
            });
          }
        });
        updateCssTransform(offsetX, offsetY, scale);
      };
      focusItem(
        objects.filter((o) => {
          const info = o.classAttributes;
          const contour = info.contour || info;
          const index = contour.viewIndex;
          const flag1 = index === imgIndex;
          const flag2 = info.trackId === props.object.classAttributes.trackId;
          return flag1 && flag2;
        }),
      );
    }
    state.object2d = object2d;
  }, 200);

  function onChange(n: number) {
    const imgs = props.data.content.filter(
      (content) => content.directoryType && content.directoryType.includes('image'),
    );
    const length = imgs.length;
    const index = state.imgIndex + n;
    state.imgIndex = Math.max(0, Math.min(length - 1, index));
  }

  const updateCssTransform = (offsetX: number, offsetY: number, scale: number) => {
    const matrix3 = new Matrix3();
    matrix3.translate(offsetX, offsetY);
    matrix3.scale(scale, scale);
    const el = matrix3.elements;
    state.transform = `translate(-50%, -50%) matrix(${el[0]},${el[1]},${el[3]},${el[4]},${el[6]},${el[7]})`;
  };

  const updateDom = (img: HTMLImageElement, svg: SVGElement) => {
    let { clientHeight, clientWidth, naturalWidth, naturalHeight } = img;
    const info = pcActiveImage.value?.extraInfo;
    if (info) {
      naturalWidth = info.width || naturalWidth;
      naturalHeight = info.height || naturalHeight;
    }
    const aspect = naturalWidth / naturalHeight;
    const fitAspect = clientWidth / clientHeight;
    let width: number;
    let height: number;
    if (aspect > fitAspect) {
      width = clientHeight * aspect;
      height = clientHeight;
    } else {
      width = clientWidth;
      height = clientWidth / aspect;
    }
    clientHeight = height;
    clientWidth = width;
    img.style.width = width + 'px';
    img.style.height = height + 'px';
    img.style.maxWidth = 'none';
    svg.style.width = width + 'px';
    svg.style.height = height + 'px';
    return {
      clientHeight,
      clientWidth,
      naturalWidth,
      naturalHeight,
    };
  };

  const updateImage = debounce(() => {
    if (props.info?.type !== datasetTypeEnum.IMAGE) return;
    const dom = cardContainer.value as HTMLDivElement;
    if (!dom) return;
    const img = dom.querySelector('img.image') as HTMLImageElement;
    const svg = dom.querySelector('svg.easy-svg') as SVGElement;
    state.transform = '';
    const results: any[] = [];
    const object = props.object?.classAttributes;
    if (img.src && img.complete && object) {
      const { clientHeight, clientWidth, naturalWidth, naturalHeight } = updateDom(img, svg);
      const imgToView_X = (x: number) => {
        return (x / naturalWidth) * clientWidth;
      };
      const imgToView_Y = (y: number) => {
        return (y / naturalHeight) * clientHeight;
      };
      const getOffsetAndScale = (points: { x: number; y: number }[]) => {
        const min = new Vector2(Infinity, Infinity);
        const max = new Vector2(-Infinity, -Infinity);
        let offsetX = 0;
        let offsetY = 0;
        let scale = 1;
        if (points.length) {
          points.forEach((p) => {
            min.min(p);
            max.max(p);
          });
          offsetX = (clientWidth - imgToView_X(min.x + max.x)) / 2;
          offsetY = (clientHeight - imgToView_Y(min.y + max.y)) / 2;
          scale = Math.min(
            clientWidth / imgToView_X(max.x - min.x),
            clientHeight / imgToView_Y(max.y - min.y),
          );
        }
        return {
          offsetX,
          offsetY,
          scale: scale * 0.3,
        };
      };
      const { contour = {}, id, type, meta = {} } = object;
      const { points = [], interior = [] } = contour;
      let _points: any = [];
      const { scale, offsetX, offsetY } = getOffsetAndScale(points);
      const cX = clientWidth / 2;
      const cY = clientHeight / 2;
      const getPoints = function getPoints(points: { x: number; y: number }[]) {
        return points
          .map((point) => {
            const _x = cX - (cX - imgToView_X(point.x) - offsetX) * scale;
            const _y = cY - (cY - imgToView_Y(point.y) - offsetY) * scale;
            return [_x, _y].join(',');
          })
          .join(' ');
      };

      if (type === I2D_TYPE.RECTANGLE) {
        if (points && points.length === 2) {
          const newPoints = points.map((point) => {
            const _x = cX - (cX - imgToView_X(point.x) - offsetX) * scale;
            const _y = cY - (cY - imgToView_Y(point.y) - offsetY) * scale;
            return [_x, _y];
          });
          const rect = [
            [newPoints[0][0], newPoints[0][1]].join(','),
            [newPoints[0][0], newPoints[1][1]].join(','),
            [newPoints[1][0], newPoints[1][1]].join(','),
            [newPoints[1][0], newPoints[0][1]].join(','),
          ];
          _points = rect.join(' ');
        } else {
          _points = getPoints(points);
        }
      } else if ([I2D_TYPE.POLYGON, I2D_TYPE.POLYLINE].includes(type)) {
        _points = getPoints(points);
      }
      const hole = interior.map((el: any) => {
        const coord = el.coordinate;
        return getPoints(coord);
      });
      updateCssTransform(offsetX, offsetY, scale);
      results.push({
        points: _points,
        type: AnnotationTypeMap[type],
        hole,
        color: meta.color,
        uuid: id,
      });
    }
    iState.imageObject = results;
  }, 200);

  watch(
    () => [props.object, props.object2D],
    () => {
      if (props.info?.type === datasetTypeEnum.LIDAR_FUSION) {
        const trackId = props.object.classAttributes.trackId;
        const objects = props.object2D[trackId];
        state.imgIndex = 0;
        if (objects?.length && objects[0]) {
          const object = objects[0].classAttributes;
          console.log(object);
          const contour = object?.contour || object;
          const index = contour?.viewIndex || 0;
          state.imgIndex = index;
        }
        update2d();
      } else if (props.info?.type === datasetTypeEnum.IMAGE) {
        updateImage();
      }
    },
    {
      immediate: true,
    },
  );

  return {
    getPcImage,
    getPlaceImg,
    iState,
    svg,
    state,
    cardContainer,
    update2d,
    onChange,
    updateImage,
    pcActiveImage,
  };
}
