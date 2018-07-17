#!/bin/bash

###########################################常量设置###########################################

set -e

rm -rf "${appDir}"

#bundleIdentifier
bundle_id="com.suning.testPodSpaceFramework"

#workspace
work_space="workSpace.xcworkspace"

#scheme
scheme="testPodSpaceFramework"

#创建保存打包结果的目录
project_path=$(pwd)
pathWithDate=${project_path}/testPodSpaceFrameworkBuild/build_test_$(date +%Y-%m-%d_%H_%M)

#xocdebuild
xcode_build="xcodebuild -workspace ${work_space} -scheme ${scheme} -configuration Release"

#工程绝对路径
project_path=$(pwd)
echo "======工程路径：${project_path}======"

#创建保存打包结果的目录
result_path=${pathWithDate}/arm
mkdir -p "${result_path}"
echo "======最终打包路径：${result_path}======"

#工程配置文件路径
project_name="testPodSpaceFramework"
echo "======工程文件名称：${project_name}======"
target_name=${project_name}
echo "======target名称：${target_name}======"

#编译配置打印到文件中
setting_out=${result_path}/build_setting.txt
${xcode_build}  -showBuildSettings > ${setting_out}

#编译路径
build_dir=$(grep " CONFIGURATION_BUILD_DIR" "${setting_out}" | cut  -d  "="  -f  2 | grep -o "[^ ]\+\( \+[^ ]\+\)*")
echo "编译路径：${build_dir}"

#打包完的程序目录
appDir=${build_dir}/../../Intermediates/ArchiveIntermediates/${scheme}/IntermediateBuildFilesPath/UninstalledProducts/iphoneos/${target_name}.framework;
echo "==========生成的framework路径:${appDir}=============="

#先clean 一下
echo "==========clean一下=========="
${xcode_build} -sdk iphoneos archive clean

#编译工程
${xcode_build} -sdk iphoneos archive || exit

#拷贝到工程目录
mkdir -p "${result_path}"
cp -R "${appDir}" "${result_path}"

#打x86包

#xcode_build="xcodebuild -workspace ${work_space} -scheme ${scheme} -configuration Release ARCHS='x86_64'  VALID_ARCHS='x86_64'"
#xcodebuild -workspace ${work_space} -scheme ${scheme} -configuration Release -destination 'platform=iOS Simulator,name=iPhone 5s'
xcode_build="xcodebuild -workspace ${work_space} -scheme ${scheme} -configuration Release -destination'platform=iOSSimulator,name=iPhone5s'"

#工程绝对路径
project_path=$(pwd)
echo "======工程路径：${project_path}======"

#创建保存打包结果的目录
result_path_x86=${pathWithDate}/x86
mkdir -p "${result_path_x86}"
echo "======最终打包路径：${result_path_x86}======"

#工程配置文件路径
project_name="testPodSpaceFramework"
echo "======工程文件名称：${project_name}======"
target_name=${project_name}
echo "======target名称：${target_name}======"

#编译配置打印到文件中
setting_out=${result_path_x86}/build_setting.txt
${xcode_build} -showBuildSettings > ${setting_out}

#编译路径
build_dir=$(grep " CONFIGURATION_BUILD_DIR" "${setting_out}" | cut  -d  "="  -f  2 | grep -o "[^ ]\+\( \+[^ ]\+\)*")
echo "===================编译路径：${build_dir}===================="

#打包完的程序目录
appDirX86=${build_dir}/../Release-iphonesimulator/${target_name}.framework;
echo "==========生成的framework路径:${appDirX86}=============="

#先clean 一下
echo "==========clean 一下=========="
xcodebuild -workspace ${work_space} -scheme ${scheme} -configuration Release -destination 'platform=iOS Simulator,name=iPhone 5s' clean

#编译工程
xcodebuild -workspace ${work_space} -scheme ${scheme} -configuration Release -destination 'platform=iOS Simulator,name=iPhone 5s'
#拷贝到工程目录
mkdir -p "${result_path_x86}"
cp -R "${appDirX86}" "${result_path_x86}"

#合并两个架构的FrameWork

if [ -d "${result_path}/${target_name}.framework" ]; then
echo "=============arm 版本framework完成============="
else
echo "=============arm 版本framework找不到文件============="
fi

if [ -d "${result_path_x86}/${target_name}.framework" ]; then
echo "=============x86 版本framework完成============="
else
echo "=============x86 版本framework找不到文件============="
fi

echo "=============合并前的arm架构framework地址 : ${result_path}/${target_name}.framework/${target_name}======================"
echo "=============合并前的x86架构framework地址 : ${result_path_x86}/${target_name}.framework/${target_name}=================="

echo "=============开始合并两个架构的framework============="
lipo -create ${result_path}/${target_name}.framework/${target_name} ${result_path_x86}/${target_name}.framework/${target_name} -output ${result_path}/${target_name}.framework/${target_name}


cp -R ${result_path}/${target_name}.framework ${pathWithDate}
echo "=============合并framework 完成,文件地址是${pathWithDate}/${target_name}.framework============="

echo "=============合并后framework的架构是:============="
lipo -info ${pathWithDate}/${target_name}.framework/${target_name}


