---
layout: review
title:  "Feature Pyramid Networks for Object Detection"
tags:   deep-learning CNN localization bounding-boxes
author: Frédéric Branchaud-Charron
pdf:   "https://arxiv.org/pdf/1612.03144.pdf"
cite:
  authors: "T. Lin, P. Dollár, R. Girshick, K. He, B. Hariharan, S. Belongie"
  title:   "Feature Pyramid Networks for Object Detection"
  venue:   "Computer Vision and Pattern Recognition, 2017. CVPR 2017"
---

The Feature Pyramid Network (FPN) looks a lot like the [U-net]({{ site.baseurl }}{% link deep-learning/_posts/2017-02-27-unet.md %}). The main difference is that there is multiple prediction layers: one for each upsampling layer.
<div align="middle">
  <img src="/deep-learning/images/fpn/architecture.png" width="400">
</div>


## FPN for region-proposal
To achieve region-proposal, the authors add a 3x3 Conv layer followed by two 1x1 Conv for classification and regression on each upsampling layer. These additions are called **heads** and the weights are shared. For each head, you assign the sames anchors boxes, resized to match the head's shape. The ground truth labels are assigned to the anchor if it has >70% IoU.

## FPN for object Detection
Using Fast(er) R-CNN, they can use FPN as the region proposal part. The proposals are used in combination with RoiPooling and then they can do the same works as Fast(er) R-CNN.

## Results
Faster R-CNN on FPN with a ResNet-101 backbone is achieving state of the art on the COCO detection benchmark. It's also faster than Resnet-101 Faster R-CNN by a significant margin because of the weight sharing in the heads.

### Effect of lateral connections
FPN performs better than normal U-Net because the U-Net's feature maps are wrong.
The authors argue that the locations of these maps are not precise,
because these maps have been downsampled and upsampled
several times. There is a 10% jump in accuracy using lateral connections.
