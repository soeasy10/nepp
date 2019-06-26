# USAGE
# python recognize_faces_image.py --encodings encodings.pickle --image examples/example_01.png 

# import the necessary packages
import face_recognition
import argparse
import pickle
import cv2

# construct the argument parser and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-e", "--encodings", required=True,
	help="path to serialized db of facial encodings")
ap.add_argument("-i", "--image", required=True,
	help="path to input image")
ap.add_argument("-d", "--detection-method", type=str, default="cnn",
	help="face detection model to use: either `hog` or `cnn`")
args = vars(ap.parse_args())

# load the known faces and embeddings
print("[INFO] loading encodings...")
data = pickle.loads(open(args["encodings"], "rb").read())

# load the input image and convert it from BGR to RGB
image = cv2.imread(args["image"])
rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

# detect the (x, y)-coordinates of the bounding boxes corresponding
# to each face in the input image, then compute the facial embeddings
# for each face
print("[INFO] recognizing faces...")
boxes = face_recognition.face_locations(rgb,
	model=args["detection_method"])
encodings = face_recognition.face_encodings(rgb, boxes)

# initialize the list of names for each face detected
names = []

# loop over the facial embeddings
for encoding in encodings:
	# attempt to match each face in the input image to our known
	# encodings
	matches = face_recognition.compare_faces(data["encodings"],
		encoding)
	name = "Unknown"

	# check to see if we have found a match
	if True in matches:
		# find the indexes of all matched faces then initialize a
		# dictionary to count the total number of times each face
		# was matched
		matchedIdxs = [i for (i, b) in enumerate(matches) if b]
		counts = {}

		# loop over the matched indexes and maintain a count for
		# each recognized face face
		for i in matchedIdxs:
			name = data["names"][i]
			counts[name] = counts.get(name, 0) + 1

		# determine the recognized face with the largest number of
		# votes (note: in the event of an unlikely tie Python will
		# select first entry in the dictionary)
		name = max(counts, key=counts.get)
	
	# update the list of names
	names.append(name)

# loop over the recognized faces
for ((top, right, bottom, left), name) in zip(boxes, names):
	# draw the predicted face name on the image
	# cv2.rectangle(image, (left, top), (right, bottom), (0, 255, 0), 2) 인식된 얼굴에 초록색 사각형 생성
	if name == 'Unknown' :
		# sub_face = image[top:bottom, left:right] 가우시안블러 얼굴범위지정
		# sub_face = cv2.GaussianBlur(sub_face,(23, 23), 30) 가우시안 블러 처리
		# image[top:top+sub_face.shape[0], left:left+sub_face.shape[1]] = sub_face 가우시안블러처리부분 다시 원래 이미지에 넣기
		sub_face = image[top:bottom, left:right] # 모자이크블러 얼굴범위 지정
		sub_face = cv2.resize(sub_face, None, fx=0.09, fy=0.09,  interpolation=cv2.INTER_AREA) # 얼굴범위 축소
		sub_face = cv2.resize(sub_face, dsize=(bottom-top, right-left), interpolation=cv2.INTER_AREA) # 다시 확대
		image[top:bottom, left:right] = sub_face # 모자이크블러처리부분 다시 원래 이미지에 넣기
	# y = top - 15 if top - 15 > 15 else top + 15 텍스트범위지정
	# cv2.putText(image, name, (left, y), cv2.FONT_HERSHEY_SIMPLEX, 텍스트 넣기
		# 0.75, (0, 255, 0), 2)

# show the output image
cv2.imshow("Image", image)
cv2.imwrite('/Users/yoon/autoblur/input/01.png', image)
cv2.waitKey(0)
