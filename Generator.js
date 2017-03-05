var component;
var object;

function createObjects(url, parent, callback) {
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
