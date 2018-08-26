## Visual Explanations From Deep 3D Convolutional Neural Networks for Alzheimer’s Disease Classification

This repo implements the methods proposed in paper https://arxiv.org/abs/1803.02544, including Sensitivity Analysis by 3D Ultrametric Contour Map (SA-3DUCM), 3D Class Activation Mapping (3D-CAM), and 3D Gradient-Weighted Class Activation Mapping (3D-Grad-CAM).

 This implemented paper is based on the work [Residual and Plain Convolutional Neural Networks for 3D Brain MRI Classification](https://arxiv.org/abs/1701.06643) and its implementation in this [repo](https://github.com/neuro-ml/resnet_cnn_mri_adni). Please cite properly if you are using code in this repo.


### Build and run docker running environment

```bash
git clone git@github.com:west-gates/3DCNN-Vis.git

cd 3DCNN-Vis

[sudo] docker build -t 3dcnnvis:repo -f Dockerfile .

[sudo] nvidia-docker run -it -p 8809:8888 -v ~/path/to/3DCNN-Vis:/scripts/ 3dcnnvis:repo jupyter notebook --no-browser
```

Open `http://localhost:8809` on your local machine.


### Train 3DCNNs for Alzheimer’s Disease Classification

You need to train 3DCNNs from your MRIs similar to this [repo](https://github.com/neuro-ml/resnet_cnn_mri_adni). Some example pre-trained 3DCNNs are provided.


### Sensitivity Analysis by 3D Ultrametric Contour Map (SA-3DUCM)

You need to run the 3DUCM code in this [repo](https://github.com/west-gates/3DUCM) to segment your MRI images first. The segmentation for the example image is provided. Then run `vgg_3d_ucm.ipynb` and `resnet_3d_ucm.ipynb` to get the visual explanations.


### 3D Class Activation Mapping (3D-CAM)

Run `resnet_3d_cam.ipynb`. Note that with 3D-CAM you need to re-train your 3DCNN. An example pre-trained one is provided.


### 3D Gradient-Weighted Class Activation Mapping (3D-Grad-CAM)

Run `vgg_3d_grad_cam.ipynb` and `resnet_3d_grad_cam.ipynb`. You can change the convolutional layer that you want to visulize by setting from which layer activations and gradients are calculated.