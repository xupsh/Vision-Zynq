# -*- coding: utf-8 -*-  
import cv2
video_capture = cv2.VideoCapture(0)
ret, frame = video_capture.read()
ret, frame = video_capture.read()
cv2.imwrite('111.bmp', frame)

