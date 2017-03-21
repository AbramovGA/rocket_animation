var component;
var object;

function createObject(url, parent, callback) {
    component = Qt.createComponent(url);
    if (component.status == Component.Ready)
        finishCreation(callback, parent);
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation(callback, parent) {
    if (component.status == Component.Ready) {
        object = component.createObject(parent);
        if (object == null)
            console.log("Error creating object");
        callback(object);
    } else if (component.status == Component.Error)
        console.log("Error loading component:", component.errorString());
}

function generateObjects(url, count, parent, callback){
    var a=new Array;
    for(var i=0;i<count;i++){
        createObject(url,parent,function(obj){
            obj.x=0;
            obj.y=0;
            a.push(obj);
        });
    }
    while(a.length<count){}
    callback(a);
}
