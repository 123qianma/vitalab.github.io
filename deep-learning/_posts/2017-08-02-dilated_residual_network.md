---
layout: review
title:  "Dilated Residual Networks"
tags:   deep-learning CNN
author: Clément Zotti
pdf:   "https://arxiv.org/pdf/1705.09914.pdf"

cite:

  authors: "F.Yu, V.Koltun, T.Funkhouser"
  title:   "Dilated Residual Networks"
  venue:   "CVPR 2017"
---

In this papers the authors shows that using dilated convolution help to produce better results for image classification,
object localisation and image segmentaion. Also the dilated convolution is kind of plug-and-play in place of regular
convolution with minor changes in the network for the differents tasks.

The datasets used for the image classification and object localisation is [ImageNet](http://www.image-net.org/) 2012 and
for the image segmentation they use [CityScapes](https://www.cityscapes-dataset.com/).

The main idea of this papers is help the network to preserve the spatial resolution of its input.

## Models

They start by using a regular [ResNet]({{ site.baseurl }}{% post_url /deep-learning/2017-03-16-resnet %})
to produce baseline results for the different tasks.

The first model called (**DRN-A**) removes the latest maxpooling and use only dilated convolution with different
dilation rate to have the same deceptive field as the maxpooling network but with a larger feature maps output.
The figure below present these changes.

<div align="middle">
<img src="/deep-learning/images/drn/drn_changes.png"/>
</div>

We can see that they use different dilation rate used to mimic the maxpooling operation.

The main idea to produce larger feature maps is that even a human in an image of 28x28 can detect useful information and so take decision.
So insead of having a feature maps of size 8x8 the dilated convolution produce a feature maps of size 28x28.

Unfortunatly the **DRN-A** network has an issue, the dilated convolution produce **gridding artifacts** in the localization task, to leverage
this problem they derive this model into two derivation, **DRN-B** and **DRN-C** which the former add some layer and remove some maxpooling operation and the later based on (DRN-B) remove residual connection in some layer to filter these artifacts.

<div align="middle">
<img src="/deep-learning/images/drn/drn_networks.png"/>
</div>

## Results

Here is a summary of the result obtain by the different network for the three dataset.
For the classification they improve the accuracy of the network with the same number of parameters and layers and manage to achieve almost the save accuracy than a really deeper network (ResNet101) with only of its parameters.
<div align="middle">
<img src="/deep-learning/images/drn/classification.png"/>
</div>
<br/><br/>
For the weakly-supervise localization the results show the same improvement than the classification task but we can see that having a larger feature maps help because they achieve a better classification accuracy than a 2 times deeper ResNet.
<div align="middle">
<img src="/deep-learning/images/drn/localization.png"/>
</div>
<br/><br/>
They didn't show the ResNet101 results but repost it's overall mean IoU for the segmentation task. Their model on average produce better IoU thant the ResNet and we can clearly see that the segmentation produced by the DRN-C is better that their DRN-A architecture. We don't know for DRN-B maybe better or worst...

<div align="middle">
<img src="/deep-learning/images/drn/segmentation.png"/>
</div>
