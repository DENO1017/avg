//生成xml对象
function createXMLDom() {
    var scripts = new Array();
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "../static/content/scripts/cut1.xml", false);
    xmlhttp.send();
    xmlDoc = xmlhttp.responseXML;
    background_img = xmlDoc.getElementsByTagName("background")[0].childNodes[0].nodeValue;
    document.getElementsByClassName("app")[0].setAttribute('style', ('background: url(../static/content/images/' + background_img + '.png) no-repeat center top'));
    var cut_scripts = xmlDoc.getElementsByTagName("script");
    for (var i = 0; i < cut_scripts.length; i++) {
        var script = {
            chara: "chara",
            emo: "emo",
            dlg: "dlg"
        };
        var cut_script = cut_scripts[i];
        script['chara'] = cut_script.childNodes[1].childNodes[0].nodeValue;
        script['emo'] = cut_script.childNodes[3].childNodes[0].nodeValue;
        script['dlg'] = cut_script.childNodes[5].childNodes[0].nodeValue;
        scripts.push(script);
    }
    return scripts;
}


$(document).ready(function () {
    var scripts = createXMLDom();
    var index = 0;
    $(".next_btn").click(function () {
        if (index < scripts.length) {
            document.getElementById("chara").textContent = scripts[index]['chara'];
            document.getElementById("dlg").textContent = scripts[index]['dlg'];
            document.getElementById("img_chara").src = "../static/content/images/" + scripts[index]['chara'] + ".png";
            index++;
        }
    });
});
