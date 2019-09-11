#读取剧本并解释
#剧本标准格式：
#角色chara(表情emo):台词dlg\n

import os
from xml.dom.minidom import Document,parse
import xml.sax

class script():
    chara = 'chara'
    dlg = 'dlg'
    emo = 'emo'
    def __init__(self, chara, dlg, emo='debug'):
        self.chara = chara
        self.dlg = dlg
        self.emo = emo

def interpreter(rows):
    scripts = []
    for row in rows:
        split_row = row.split("：")
        chara = split_row[0]
        dlg = split_row[1]
        scripts.append(script(chara,dlg))
    return scripts

def fileRead(filename):
    f = open(filename)
    data = f.read()
    rows = data.split('\n')
    return rows

def SaveXML(scripts):
    path='avgMaker/static/content/scripts'
    doc = Document()
    root = doc.createElement('root')
    doc.appendChild(root)

    head = doc.createElement('head')
    root.appendChild(head)

    cut = doc.createElement('cut')
    cut_text = doc.createTextNode('1')
    cut.appendChild(cut_text)
    head.appendChild(cut)
    
    background = doc.createElement('background')
    background_text = doc.createTextNode('街市-傍晚')
    background.appendChild(background_text)
    head.appendChild(background)

    body = doc.createElement('body')
    root.appendChild(body)

    for script in scripts:
        t_script = doc.createElement('script')
        body.appendChild(t_script)

        chara = doc.createElement('chara')
        chara_text = doc.createTextNode(script.chara)
        chara.appendChild(chara_text)
        t_script.appendChild(chara)

        emo = doc.createElement('emo')
        emo_text = doc.createTextNode(script.emo)
        emo.appendChild(emo_text)
        t_script.appendChild(emo)

        dlg = doc.createElement('dlg')
        dlg_text = doc.createTextNode(script.dlg)
        dlg.appendChild(dlg_text)
        t_script.appendChild(dlg)

    filename = path + '/cut1.xml'
    with open(filename,'wb+') as f:
        f.write(doc.toprettyxml(indent='\t',encoding='utf-8'))
            
    