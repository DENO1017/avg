var tabModelList=[];
var scriptList=[];
var curIndex=1;
var scriptCount=0;

var optionScript=[];
var optionNext=[];

function getOptions(model){
    var i=0;
    optionScript=[];
    optionNext=[];
    for(i=0;i<model.count;i++){
        optionScript[i]=model.get(i).script;
        optionNext[i]=model.get(i).next;
    }
    console.log(optionNext);
    console.log(optionScript);
}


function getCurIndex(){
    curIndex++;
    return curIndex;
}

function clearTabModels() {
    tabModelList.count = 0;
}

