/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtWebView 1.1
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2
import "Tools.js" as Tools


ApplicationWindow {//顶层窗口
    id:root
    property bool showProgress: webView.loading//定义bool属性showProgress，值为webView是否在loading
    visible: true//窗口可见
    x: 100
    y: 100
    width: 1500
    height: 900
    title: qsTr("srtp文字冒险迷你引擎")//标题
//工具栏
    toolBar: ToolBar {
        id: navigationBar
        RowLayout {
            anchors.fill: parent
            spacing: 0
            ToolButton{
                id:openfileButton
                tooltip: qsTr("打开文件")
                iconSource: "icon/open-32.png"
                Layout.preferredWidth: navigationBar.height
                style: ButtonStyle {
                    background: Rectangle { color: "transparent" }
                }
                onClicked: {
                    fds.open();
                }
            }

            FileDialog{
                id:fds
                title: qsTr("选择文件")
                //folder: shortcuts.desktop
                selectExisting: true
                selectFolder: false
                selectMultiple: false
                nameFilters: ["图片(*.png)","音乐(*.mp3)","文本(*.txt)"]
                onAccepted: {
                    var filepath = fds.fileUrl.toString();
                    var dot = filepath.lastIndexOf(".");
                    var sep = filepath.lastIndexOf("/");
                    if(dot>sep){
                        var ext = filepath.substring(dot);
                    }
                    else{
                        root.statusBar.text = "Not Supported!";
                    }

                    tabView.processFile(fds.fileUrl.toString(),ext.toLowerCase());

                    //tabView.processFile(fds.fileUrl, ext.toLowerCase());


                    //labels.text = fds.fileUrl;
                }

            }


            Item { Layout.preferredWidth: 5 }
/*
            TextField {
                Layout.fillWidth: true
                id: urlField
                inputMethodHints: Qt.ImhUrlCharactersOnly | Qt.ImhPreferLowercase
                text: webView.url

                onAccepted: webView.url = utils.fromUserInput(text)

                ProgressBar {
                    anchors.centerIn: parent
                    style: LoadProgressStyle { }
                    z: Qt.platform.os === "android" ? -1 : 1
                    visible: showProgress
                    minimumValue: 0
                    maximumValue: 100
                    value: webView.loadProgress == 100 ? 0 : webView.loadProgress
                }
            }

            Item { Layout.preferredWidth: 5 }

            ToolButton {
                id: goButton
                text: qsTr("Go")
                Layout.preferredWidth: navigationBar.height
                onClicked: {
                    Qt.inputMethod.commit()
                    Qt.inputMethod.hide()
                    webView.url = utils.fromUserInput(urlField.text)
                }
                style: ButtonStyle {
                    background: Rectangle { color: "transparent" }
                }
            }

            Item { Layout.preferredWidth: 10 }

*/

        }
    }
//加载状态栏_显示网站是否加载完成
    statusBar: StatusBar {
        id: statusBar
        visible: showProgress
        RowLayout {
            anchors.fill: parent
            Label { text: webView.loadProgress == 100 ? qsTr("Done") : qsTr("Loading: ") + webView.loadProgress + "%" }
        }
    }


    Column{
        id:tagColumn
        spacing: 0
        width: 60
        height: initialHeight
        Rectangle{
            width: 60
            height: initialHeight*1.0/6.0
            Text{
                id:chara
                text: "角色"
                font.pointSize: 12
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    tabView.currentIndex = 0
                }
            }
        }
        Rectangle{
            width: 60
            height: initialHeight*1.0/6.0
            Text{
                id:background
                text: "背景"
                font.pointSize: 12
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    tabView.currentIndex = 1
                }
            }
        }
        Rectangle{
            width: 60
            height: initialHeight*1.0/6.0
            Text{
                id:music
                text: "音乐"
                font.pointSize: 12
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    tabView.currentIndex = 2
                }
            }
        }
        Rectangle{
            width: 60
            height: initialHeight*1.0/6.0
            Text{
                id:ui
                text: "UI"
                font.pointSize: 12
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    tabView.currentIndex = 3
                }
            }
        }
        Rectangle{
            width: 60
            height: initialHeight*1.0/6.0
            Text{
                id:text
                text: "文案"
                font.pointSize: 12
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    tabView.currentIndex = 4
                }
            }
        }
    }
    TabView{
        id:tabView
        anchors.left: tagColumn.right
        anchors.top: tagColumn.top
        height: tagColumn.height
        tabsVisible: false
        Component{
            id: imageDelegate
            Item{
                width: initialWidth*1.0/3.0
                height: initialHeight*1.0/5.0
                Column{
                    Text{
                        text: '<b>Name:</b>'+name
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        imageViewer.source=Url;
                    }
                }
            }
        }
        Tab{
            Rectangle{
                id:charaList
                anchors.fill:parent

                ListView{
                    id: charalistView
                    anchors.fill:parent
                    model: charaListModel
                    delegate: imageDelegate
                    focus: true
                    Component.onCompleted: {
                        //Tools.tabModelList[0]=contactDelegate
                    }
                }
            }
        }
        Tab{
            Rectangle{
                id:backgroundList
                anchors.fill:parent


                ListView{
                    id: backgroundlistView
                    anchors.fill:parent
                    model: backgroundListModel
                    delegate: imageDelegate
                    focus: true
                }
            }
        }
        Tab{
            Rectangle{
                id:musicList
                anchors.fill:parent
                Component{
                    id: contactDelegate
                    Item{
                        width: initialWidth*1.0/3.0
                        height: initialHeight*1.0/5.0
                        Column{
                            Text{
                                text: '<b>Name:</b>'+name
                            }
                            Text{
                                text: '<b>Number:</b>'+Url
                            }
                        }
                    }
                }

                ListView{
                    id: musiclistView
                    anchors.fill:parent
                    model: ContractModel{}
                    delegate: contactDelegate
                    focus: true
                }
            }
        }
        Tab{
            Rectangle{
                id:uiList
                anchors.fill:parent
                Component{
                    id: contactDelegate
                    Item{
                        width: initialWidth*1.0/3.0
                        height: initialHeight*1.0/5.0
                        Column{
                            Text{
                                text: '<b>Name:</b>'+name
                            }
                            Text{
                                text: '<b>Number:</b>'+Url
                            }
                        }
                    }
                }

                ListView{
                    id: uilistView
                    anchors.fill:parent
                    model: ContractModel{}
                    delegate: contactDelegate
                    focus: true
                }
            }
        }
        Tab{
            id:textTab
            Rectangle{
                id:textRec
                anchors.fill:parent
                Component{
                    id: textDelegate
                    Item{
                        width: initialWidth*1.0/3.0
                        height: initialHeight*1.0/5.0
                        Column{
                            Text{
                                text: '<b>Name:</b>'+name
                            }
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                textArea.curFileName=name;
                                textArea.curFileUrl=Url;
                                textArea.loadText();
                            }
                        }
                    }
                }

                ListView{
                    id: textlistView
                    anchors.fill:parent
                    model: textListModel
                    delegate: textDelegate
                    focus: true
                    Component.onCompleted: {
                        //Tools.tabModelList[2]=textListModel
                    }
                }
            }
        }

        ListModel{
            id:textListModel
        }

        ListModel{
            id:charaListModel
        }

        ListModel{
            id:backgroundListModel
        }

        Dialog{
            id:pngTypeDlg
            ComboBox{
                id:pngTypeCbb
                model:["角色","背景"]
            }
            onAccepted: {
                console.log(pngTypeCbb.currentIndex);
                var index=pngTypeCbb.currentIndex;
                var filepath = fds.fileUrl.toString();
                var dot = filepath.lastIndexOf(".");
                var sep = filepath.lastIndexOf("/");
                if(index==0){
                    charaListModel.append({"name":filepath.substring(sep+1,dot),"Url":filepath});
                }
                else{
                    backgroundListModel.append({"name":filepath.substring(sep+1,dot),"Url":filepath});
                }
            }
        }


        function processFile(fileUrl,ext){
            var i =0;
            var filepath = fds.fileUrl.toString();
            var dot = filepath.lastIndexOf(".");
            var sep = filepath.lastIndexOf("/");
            for(;i<fds.nameFilters.length;i++){
                if(fds.nameFilters[i].search(ext)!==-1)break;
            }
            switch(i){
            case 0:
                //图片*.png
                pngTypeDlg.open();
                break;
            case 1:
                //音乐*.mp3
                //textlistView.model.append({"name":filepath.substring(sep+1,dot),"Url":filepath});
                break;
            case 2:
                //文本*.txt
                textListModel.append({"name":filepath.substring(sep+1,dot),"Url":filepath});
                Tools.scriptList[Tools.scriptCount++]=filepath.substring(sep+1,dot);
                break;
            }
        }
    }




    WebView {
        id: webView
        //anchors.fill: parent  填满父对象
        anchors.top: tabView.top
        anchors.left: tabView.right
        width: 900
        height: 500

//        anchors.left: parent.left
//        anchors.right: parent.horizontalCenter
//        anchors.top:parent.top
//        anchors.bottom: parent.verticalCenter
        url: "E:/srtp/gui_of_QT/build-avgMaker-Desktop_Qt_5_11_2_MSVC2017_64bit-Debug/www/index.html"
        onLoadingChanged: {
            if (loadRequest.errorString)
                console.error(loadRequest.errorString);
        }
    }

    Rectangle{
        id: textToolBar

        anchors.top: webView.bottom
        anchors.left: webView.right
        anchors.right: webView.right
        height: 50
        RowLayout {
            spacing: 10
            Button{
                id:reloadBtn
                iconSource: "icon/reload.png"
                style: ButtonStyle {
                    background: Rectangle { color: "transparent" }
                }
                Layout.preferredWidth: textToolBar.height
                onClicked: {
                    webView.reload();
                }
            }

            Button{
                id:saveXmlBtn
                tooltip: qsTr("保存文件")
                iconSource: "icon/open-32.png"
                Layout.preferredWidth: textToolBar.height
                style: ButtonStyle {
                    background: Rectangle { color: "transparent" }
                }
                onClicked: {
                    utils.saveXML(textArea.curFileName,textArea.text);
                    saveSuccess.open();
                }
            }
            Dialog{
                id:saveSuccess
                Label{
                    font.pixelSize: 30
                    text: "save Success!"
                }
            }

            Item { Layout.preferredWidth: 5 }
            Button{
                id:linkBtn
                tooltip: qsTr("连接节点")
                iconSource: "icon/link.png"
                Layout.preferredWidth: textToolBar.height
                style: ButtonStyle {
                    background: Rectangle { color: "transparent" }
                }
                onClicked: {
                    linkDialog.open();
                }
            }

            Item { Layout.preferredWidth: 5 }

            Dialog{

                id: linkDialog
                width: 500
                height: 500
                visible: false
                title: "选项设置"
                standardButtons: StandardButton.Save|StandardButton.Cancel
                onAccepted: {
                    console.log("linkDialog Accepted!");
                    Tools.getOptions(linkDiaListmodel);

                    utils.createOption(Tools.optionScript,Tools.optionNext);
                    //console.log("option:"+mtext.text)
                }

                Component{
                    id: linkDiaDelegate
                    Item{
                        width: 400
                        height: 100
                        Label{
                            id:linkDiaLabel1
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            font.pixelSize: 30
                            text: "No."+number+":"
                            color: "blue"
                        }

                        TextInput{
                            id:linkDiaText
                            anchors.left: linkDiaLabel1.right
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom

                            selectByMouse: true
                            font.pixelSize: 30
                            text: "选项"+number
                            onTextChanged: {
                                console.log("changing of Text");
                                script=text;
                            }
                        }

                        Label{
                            id:linkDiaLabel2
                            anchors.left: linkDiaText.right
                            anchors.leftMargin: 20
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            font.pixelSize: 30
                            color: "blue"
                            text: "转至->"
                        }

                        ComboBox{
                            id:linkDiaCbb
                            anchors.left:linkDiaLabel2.right
                            anchors.leftMargin: 20
                            width: 100
                            textRole: "name"
                            model:textListModel
                            onCurrentTextChanged:  {
                                console.log("changing of Text");
                                next=currentText;
                            }
                        }
                        //LineEdit{

                    }
                }

                ListView{
                    id: linkDiaListview
                    anchors.fill:parent
                    anchors.bottomMargin: 100
                    model: linkDiaListmodel
                    delegate: linkDiaDelegate
                    focus: true
                    Component.onCompleted: {
                        //Tools.tabModelList[0]=contactDelegate
                    }
                }
                Button{
                    id:linkDiaAddBtn
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 50
                    text:"增加"
                    onClicked: {
                        linkDiaListmodel.append({"number":Tools.getCurIndex(),"script":"xxx","next":"ddd"})
                    }
                }

                ListModel{
                    id:linkDiaListmodel
                    ListElement{
                        number:1
                        script:"aaa"
                        next:"bbb"
                    }
                }


            }
        }
    }

    Image {
        id: imageViewer
        anchors.top: webView.top
        anchors.left: webView.right
        anchors.right: root.right
        anchors.bottom: webView.bottom
        asynchronous: true;
        fillMode: Image.PreserveAspectFit;
        source: ""
    }

    TextArea{
        id:textArea

        anchors.top: textToolBar.bottom
        anchors.left: tabView.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        property var xmlhttp: null
        property var curFileName
        property var curFileUrl

        function onReadyStateChanged(){
            if(xmlhttp.readyState == xmlhttp.DONE){
                textArea.text = xmlhttp.responseText;
                xmlhttp.abort()
            }
        }

        function loadText(){

            if(xmlhttp==null){
                xmlhttp = new XMLHttpRequest()
                xmlhttp.onreadystatechange = onReadyStateChanged;
            }
            if(xmlhttp.readyState == 0){
                xmlhttp.open("GET",curFileUrl);
                xmlhttp.send();
            }
        }

//        anchors.left: parent.left
//        anchors.right: parent.right
//        anchors.top:webView.bottom
//        anchors.bottom: parent.bottom
        style: TextAreaStyle{
            textColor: "#333"
            selectionColor: "steelblue"
            selectedTextColor: "#eee"
            backgroundColor: "#eee"

        }
    }



    /*
    ScrollView{
        id: textScroll
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: webView.bottom
        anchors.bottom: parent.bottom

        Rectangle{
                    id: rect
                    width: 500
                    height: 900;
                    Rectangle{
                        id:rect1;
                        anchors.top: rect.top
                        width: 500
                        height: 300
                        color: "red"
                        border.color: "blue"
                    }
                    Rectangle{
                        id: rect2
                        anchors.top: rect1.bottom
                        width: 500
                        height: 300
                        color: "green"
                        border.color: "blue"
                    }
                    Rectangle{
                        id: rect3
                        anchors.top: rect2.bottom
                        width: 500
                        height: 900
                        color: "orange"
                        border.color: "blue"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                scroll.flickableItem.contentY = rect2.y
                            }
                        }
                    }
                }

    }*/
}
