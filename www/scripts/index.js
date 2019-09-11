// 有关“空白”模板的简介，请参阅以下文档:
// http://go.microsoft.com/fwlink/?LinkID=397704
// 若要在 cordova-simulate 或 Android 设备/仿真器上在页面加载时调试代码: 启动应用，设置断点，
// 然后在 JavaScript 控制台中运行 "window.location.reload()"。

var data;
var flag;
var content;
var next;
var index = 0;

$(document).ready(function () {
    data = getDialogue('cut1');
    flag = data[0];
    content = data[1];
    $('.dialogue').click(dialogue);
    dialogue();
});


//获取dialogue内容
function getDialogue(filename) {
    var data = new Array();
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../www/xml/" + filename + ".xml", false);
    xmlhttp.send();
    xmlDoc = xmlhttp.responseXML;
    type = xmlDoc.getElementsByTagName("type")[0].childNodes[0].nodeValue;
    if (type == "script")
    {
        next = xmlDoc.getElementsByTagName("next")[0].childNodes[0].nodeValue;
        var scripts = new Array();
        data.push(1);
        background_img = xmlDoc.getElementsByTagName("background")[0].childNodes[0].nodeValue;
        document.getElementsByClassName("app")[0].setAttribute('style', ('background: url(../www/images/' + background_img + '.png) no-repeat center top'));
        var cut_scripts = xmlDoc.getElementsByTagName("script");
        for (var i = 0; i < cut_scripts.length; i++) {
            var script = {
                chara: "chara",
                emo: "emo",
                dlg: "dlg"
            };
            var cut_script = cut_scripts[i];
            script["chara"] = cut_script.childNodes[1].childNodes[0].nodeValue;
            script["emo"] = cut_script.childNodes[3].childNodes[0].nodeValue;
            script["dlg"] = cut_script.childNodes[5].childNodes[0].nodeValue;
            scripts.push(script);
        }
        data.push(scripts);
        data.push(next);
    }
    else if (type == "option")
    {
        data.push(2);
        var options = new Array();
        var cut_options = xmlDoc.getElementsByTagName("option");
        for (var i = 0; i < cut_options.length; i++) {
            var option = {
                script: "script",
                next: "next"
            };
            var cut_option = cut_options[i];
            option["script"] = cut_option.childNodes[1].childNodes[0].nodeValue;
            option["next"] = cut_option.childNodes[3].childNodes[0].nodeValue;
            options.push(option);
        }
        data.push(options);
    }
    return data;
}


function option(next) {
    data = getDialogue(next);
    flag = data[0];
    content = data[1];
    document.getElementsByClassName("options")[0].setAttribute('style', ('display: none'));
    //dialogue();
    console.log("option flag = "+flag);
}

function dialogue() {
    if (flag == 1) {
        console.log(index);
        if (index < content.length) {
            document.getElementById("chara").textContent = content[index]['chara'];
            document.getElementById("dlg").textContent = content[index]['dlg'];
            document.getElementById("img_chara").src = "../www/images/" + content[index]['chara'] + ".png";
            index++;
        }
        else {
            next = data[2];
            index = 0;
            document.getElementById("chara").textContent = "";
            document.getElementById("dlg").textContent = "";
            document.getElementById("img_chara").src = "";
            data = getDialogue(next);
            flag = data[0];
            content = data[1];
            console.log("dialogue");
            dialogue();
        }
    }
    else {
        var options_element = document.getElementsByClassName("options")[0];
        options_element.setAttribute('style', ('display: block'));
        var a = 0;
        a = 5;
        for (var i = 0; i < content.length; i++) {
            var op = document.getElementById("op" + i);
            op.setAttribute("style", ('display: block'));
            op.setAttribute("onclick", "option(" + content[i]["next"] + "," + i + ")");
            op.style.display = "block";
            var node = document.createTextNode(content[i]["script"]);
            op.textContent = content[i]["script"];
            op.setAttribute("data-n", content[i]["next"]);
            $('#op' + i).click(function () {
                console.log(this.dataset);
                option(this.getAttribute("data-n"));
            })
        }
        console.log(document.getElementsByClassName("app")[0]);
    }
};
