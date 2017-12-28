import QtQuick 2.0

Rectangle {
    id: myButton;

    property alias operation: myButtonText.text;
    property alias color: myButton.color;

    signal clicked();

    Text {
        id:                 myButtonText;
        text:               operation
        smooth:             true;
        color:              "floralwhite";
        anchors.centerIn:   parent;
        font.pixelSize:     parent.height * .5;
    }

    MouseArea {
        id:             myButtonMouseArea;
        anchors.fill:   parent;
        onClicked: {
            myButton.clicked();
            doOperation(operation);
        }
    }

    states: State {
        name: "pressed"; when: myButtonMouseArea.pressed === true
        PropertyChanges { target: myButton; color: "purple"; }
    }
}
