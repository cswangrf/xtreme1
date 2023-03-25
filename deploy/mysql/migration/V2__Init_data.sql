INSERT INTO `x1_community`.`model`(`id`, `name`, `version`, `description`, `scenario`, `dataset_type`, `model_type`, `model_code`, `url`, `is_deleted`, `del_unique_key`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, 'Basic Lidar Object Detection11', 'v0.1.2', '<p>Basic Lidar Object Detection Model empowers you to detect the most common classes precisely and efficiently during lidar and lidar fusion annotation in Autonomous Vehicle Industry.&nbsp;<br><br>• &nbsp;BLOD is a hyper-based methodology invented, trained and maintained by Basic AI&nbsp;<br><br>• &nbsp;BLOD has been testified in more than 20TB production data.&nbsp;<br><br>• &nbsp;BLOD boosts your annotation speed by at least 26%<br><br>• &nbsp;Try it for free now!</p>', '[\"Lidar\",\"Lidar fusion\",\"Autonomous Vehicle\",\"Object Detection\"]', 'LIDAR', 'DETECTION', 'LIDAR_DETECTION', 'http://106.15.11.113:5006/pointCloud/recognition', b'0', 0, current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model`(`id`, `name`, `version`, `description`, `scenario`, `dataset_type`, `model_type`, `model_code`, `url`, `is_deleted`, `del_unique_key`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'COCO Object Detection', 'v0.1.0', '<p>\r\n    The COCO Object Detection Model, trained on MS COCO dataset, empowers you to detect 80 common classes precisely and efficiently. It outputs both bounding boxes and classes.\r\n</p>\r\n<p>\r\n    • &nbsp;It saves your annotation edits by at least 41.3% in 80 COCO classes.\r\n</p>\r\n<p>\r\n    • &nbsp;It is extremely fast. Results can be obtained in a short time.\r\n</p>\r\n<p>\r\n    • &nbsp;It is highly expandable, which allows new models with new datasets and classes to be trained easily. Contact us to know more.\r\n</p>\r\n<p>\r\n    • &nbsp;Try it for FREE now!\r\n</p>', '[\"Common Objects Detection\"]', 'IMAGE', 'DETECTION', 'IMAGE_DETECTION', 'http://124.70.35.89:18883/image/recognition ', b'0', 0, current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`user`(`id`,`username`, `password`, `nickname`) VALUES (1,'admin@xtreme1.io', '$2a$10$0qk8vIkREsV6KYPeYJLU..C/JxJZc/ccfZIcEmFcnS8W9DtOD/y5K', 'admin');
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Person', 'PERSON', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Bicycle', 'BICYCLE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Car', 'CAR', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Motorcycle', 'MOTORCYCLE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Airplane', 'AIRPLANE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Train', 'TRAIN', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Truck', 'TRUCK', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Boat', 'BOAT', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Traffic Light', 'TRAFFIC LIGHT', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Fire Hydrant', 'FIRE HYDRANT', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Stop Sign', 'STOP SIGN', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Parking Meter', 'PARKING METER', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Bench', 'BENCH', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Bird', 'BIRD', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Cat', 'CAT', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Dog', 'DOG', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Horse', 'HORSE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Sheep', 'SHEEP', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Cow', 'COW', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Elephant', 'ELEPHANT', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Bear', 'BEAR', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Zebra', 'ZEBRA', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Giraffe', 'GIRAFFE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Backpack', 'BACKPACK', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Umbrella', 'UMBRELLA', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Handbag', 'HANDBAG', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Tie', 'TIE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Suitcase', 'SUITCASE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Frisbee', 'FRISBEE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Skis', 'SKIS', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Snowboard', 'SNOWBOARD', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Sports Ball', 'SPORTS BALL', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Kite', 'KITE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Baseball Bat', 'BASEBALL BAT', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Baseball Glove', 'BASEBALL GLOVE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Skateboard', 'SKATEBOARD', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Surfboard', 'SURFBOARD', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Tennis Racket', 'TENNIS RACKET', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Bottle', 'BOTTLE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Wine Glass', 'WINE GLASS', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Cup', 'CUP', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Fork', 'FORK', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Knife', 'KNIFE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Spoon', 'SPOON', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Bowl', 'BOWL', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Banana', 'BANANA', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Apple', 'APPLE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Sandwich', 'SANDWICH', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Orange', 'ORANGE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Broccoli', 'BROCCOLI', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Carrot', 'CARROT', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Hot Dog', 'HOT DOG', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Pizza', 'PIZZA', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Donut', 'DONUT', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Cake', 'CAKE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Chair', 'CHAIR', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Couch', 'COUCH', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Potted Plant', 'POTTED PLANT', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Bed', 'BED', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Dining Table', 'DINING TABLE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Toilet', 'TOILET', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Tv', 'TV', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Laptop', 'LAPTOP', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Mouse', 'MOUSE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Remote', 'REMOTE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Keyboard', 'KEYBOARD', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Cell Phone', 'CELL PHONE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Microwave', 'MICROWAVE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Oven', 'OVEN', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Toaster', 'TOASTER', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Sink', 'SINK', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Refrigerator', 'REFRIGERATOR', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Book', 'BOOK', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Clock', 'CLOCK', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Vase', 'VASE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Scissors', 'SCISSORS', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Teddy Bear', 'TEDDY BEAR', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Hair Drier', 'HAIR DRIER', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Toothbrush', 'TOOTHBRUSH', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (2, 'Bus', 'BUS', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, 'Car', 'CAR', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, 'Truck', 'TRUCK', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, 'Construction Vehicle', 'CONSTRUCTION_VEHICLE ', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, ' Bus', 'BUS', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, 'Trailer', 'TRAILER', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, 'Barrier', 'BARRIER', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, 'Motorcycle', 'MOTORCYCLE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, 'Bicycle', 'BICYCLE', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, 'Pedestrian', 'PEDESTRIAN', current_timestamp, 1, NULL, NULL);
INSERT INTO `x1_community`.`model_class`(`model_id`, `name`, `code`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES (1, 'Traffic Cone', 'TRAFFIC_CONE', current_timestamp, 1, NULL, NULL);
