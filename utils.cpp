#include "utils.h"

void Utils::saveXML(QString fileName,QString fileContent){
    QByteArray ba = ("./www/xml/"+fileName+".xml").toLatin1();
    //string fullContent = string((const char *)fileContent.toLocal8Bit());
    string fullContent = fileContent.toStdString();
    vector<string> v;
    SplitString(fullContent, v,"\n");

    TiXmlDocument doc;
    TiXmlDeclaration* decl = new TiXmlDeclaration("1.0","","");
    doc.LinkEndChild(decl);

    TiXmlElement * xmlRoot = new TiXmlElement("root");
    doc.LinkEndChild(xmlRoot);

    TiXmlElement* xmlHead = new TiXmlElement("head");
    xmlRoot->LinkEndChild(xmlHead);

    TiXmlElement* type = new TiXmlElement("type");
    type->LinkEndChild(new TiXmlText("script"));
    xmlHead->LinkEndChild(type);

    TiXmlElement* background = new TiXmlElement("background");
    background->LinkEndChild(new TiXmlText("街市-傍晚"));
    xmlHead->LinkEndChild(background);

    TiXmlElement* nextN = new TiXmlElement("next");
    nextN->LinkEndChild(new TiXmlText((fileName.toStdString()+"option").c_str()));
    xmlHead->LinkEndChild(nextN);

    TiXmlElement* xmlBody = new TiXmlElement("body");
    xmlRoot->LinkEndChild(xmlBody);

    for(auto val : v){
        vector<string> t;
        SplitString(val,t,":");
        string chara;
        string dlg;
        chara = t[0];
        dlg = t[1];

        TiXmlElement* script = new TiXmlElement("script");

        TiXmlElement* xmlChara = new TiXmlElement("chara");
        xmlChara->LinkEndChild(new TiXmlText(chara.c_str()));
        script->LinkEndChild(xmlChara);

        TiXmlElement* xmlEmo = new TiXmlElement("emo");
        xmlEmo->LinkEndChild(new TiXmlText("debug"));
        script->LinkEndChild(xmlEmo);

        TiXmlElement* xmlDlg = new TiXmlElement("dlg");
        xmlDlg->LinkEndChild(new TiXmlText(dlg.c_str()));
        script->LinkEndChild(xmlDlg);

        xmlBody->LinkEndChild(script);
    }

    doc.SaveFile(ba.data());
    saveOptionXML(fileName+"option");
}

void Utils::SplitString(const string& s, vector<string>& v, const string& c)
{
    string::size_type pos1, pos2;
    pos2 = s.find(c);
    pos1 = 0;
    while(string::npos != pos2)
    {
        v.push_back(s.substr(pos1, pos2-pos1));

        pos1 = pos2 + c.size();
        pos2 = s.find(c, pos1);
    }
    if(pos1 != s.length())
        v.push_back(s.substr(pos1));
}

void Utils::saveOptionXML(QString fileName){
    QByteArray ba = ("./www/xml/"+fileName+".xml").toLatin1();

    TiXmlDocument doc;
    TiXmlDeclaration* decl = new TiXmlDeclaration("1.0","","");
    doc.LinkEndChild(decl);

    TiXmlElement * xmlRoot = new TiXmlElement("root");
    doc.LinkEndChild(xmlRoot);

    TiXmlElement* xmlHead = new TiXmlElement("head");
    xmlRoot->LinkEndChild(xmlHead);

    TiXmlElement* type = new TiXmlElement("type");
    type->LinkEndChild(new TiXmlText("option"));
    xmlHead->LinkEndChild(type);

    TiXmlElement* xmlBody = new TiXmlElement("body");
    xmlRoot->LinkEndChild(xmlBody);

    for(auto o : options){
        TiXmlElement* so = new TiXmlElement("option");

        TiXmlElement* sscript = new TiXmlElement("script");
        sscript->LinkEndChild(new TiXmlText(o.script.c_str()));
        so->LinkEndChild(sscript);

        TiXmlElement* snext = new TiXmlElement("next");
        snext->LinkEndChild(new TiXmlText(o.next.c_str()));
        so->LinkEndChild(snext);

        xmlBody->LinkEndChild(so);
    }

    doc.SaveFile(ba.data());
}

void Utils::createOption(QStringList qscript,QStringList qnext){
    options.clear();
    for(int i=0;i<qscript.count();i++){
        option o;
        o.script=qscript[i].toStdString();
        o.next=qnext[i].toStdString();
        options.push_back(o);
    }
}
