folder="/usr/local/src"

echo "** Remove OpenCV3.3 first"
apt-get purge *libopencv*

echo "** Install requirement"
apt-get update
apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
apt-get install -y python2.7-dev python3.6-dev python-dev python-numpy python3-numpy
apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp
apt-get install -y curl qt5-default
apt-get update

echo "** Download opencv-4.1.1"
cd $folder
curl -L https://github.com/opencv/opencv/archive/4.1.1.zip -o opencv-4.1.1.zip
curl -L https://github.com/opencv/opencv_contrib/archive/4.1.1.zip -o opencv_contrib-4.1.1.zip
unzip opencv-4.1.1.zip 
unzip opencv_contrib-4.1.1.zip 
cd opencv-4.1.1/

echo "** Building..."
mkdir release
cd release/
#cmake -D WITH_CUDA=ON -D ENABLE_PRECOMPILED_HEADERS=OFF  -D CUDA_ARCH_BIN="5.3" -D CUDA_ARCH_PTX="" -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.1.1/modules -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python2=ON -D BUILD_opencv_python3=ON -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
cmake -D WITH_CUDA=ON -D ENABLE_PRECOMPILED_HEADERS=OFF  -D CUDA_ARCH_BIN="6.2" -D CUDA_ARCH_PTX="" -D ENABLE_FAST_MATH=ON -D CUDA_FAST_MATH=ON -D WITH_CUBLAS=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.1.1/modules -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python2=ON -D BUILD_opencv_python3=ON -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_GTK=OFF -D WITH_QT=ON ..

make -j3
make install

echo "** Installed opencv-4.1.1 successfully"
echo "** Bye :)"
