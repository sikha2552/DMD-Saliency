% This Matlab code detects the salient region from the given input image.
% input: Color images of size MXNX3
%Output:Saliency map
%AUTHOR: SIKHA O K
         %Refer and cite the following material for detailed explanations
            % Sikha, O. K., S. Sachin Kumar, and K. P. Soman. "Salient region detection and object segmentation in color images using dynamic mode decomposition." 
            % Journal of Computational Science 25 (2018): 351-366.
close all;
clear all;
clc;
clc;
img = imread('im1.jpg');
img=imresize(img,[250,250]);
figure;imshow(img);title('Input Image');
%%%%%%COLOR BASED SALIENCY MAP %%%%%%%%
sm1=color_sal(img);
sm1=imfilter(sm1, fspecial('gaussian', [3,3], .25));
sm1=(sm1-min(sm1(:)))./(max(sm1(:))-min(sm1(:)));
%%%%%%INTENSITY BASED SALIENCY MAP %%%%%%%%
 sm2=sal_intensity(img);
 sm2=(sm2-min(sm2(:)))./(max(sm2(:))-min(sm2(:)));
 sm2=imclearborder(sm2);
 %%%%%%FINAL SALIENCY MAP %%%%%%%%
  final=(sm1+sm2);
  figure;imshow(final);title('befor morphsmooth');
  final=(final-min(final(:)))./(max(final(:))-min(final(:)));
  final1=morphSmooth(final,10);
  figure;imshow(final1);title('after morphsmooth');
  final1 = enhanceContrast(final1, 10);
  figure;imshow(final1);title('DMD SALIENCY MAP');
