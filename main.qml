import QtQuick 2.10
import QtQuick.Controls 2.2
import QtQuick.Window 2.10
import QtQuick.Layouts 1.3

ApplicationWindow {
    id:             mainWindow;
    visible:        true;
    width:          mainWindowWidth;
    height:         mainWindowHeight;
    minimumWidth:   mainWindowWidth;
    minimumHeight:  mainWindowHeight;
    title:          qsTr("Calculator");

    // Declare properties
    property int mainWindowWidth:           332;
    property int mainWindowHeight:          295;
    property color numberButtonColor:       "blueviolet";
    property color operationButtonColor:    "hotpink";

    Rectangle {
        anchors.fill:   parent;
        color:          "lightgrey";

        Column {
            id:         columnBox;
            spacing:    8;
            anchors {
                fill:           parent;
                topMargin:      6;
                bottomMargin:   6;
                leftMargin:     6;
                rightMargin:    6;
            }

            TextField {
                id:                         textFieldInput;
                height:                     mainWindow.height / 6;
                width:                      columnBox.width;
                font.pixelSize:             height / 2;
                horizontalAlignment:        TextInput.AlignRight;
                anchors.horizontalCenter:   parent.horizontalCenter;
            }

            Column {
                id:         columnKeyboard;
                spacing:    6;

                property real buttonHeight: (((columnBox.height - textFieldInput.height) / nButtonRow) - (nButtonRow + spacing / 2));
                property real buttonWidth:  (columnBox.width / nButtonCol) - (nButtonCol - 1);
                property int nButtonCol:    6;
                property int nButtonRow:    4;

                Row {
                    spacing: 6;

                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("7"); color: numberButtonColor; }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("8"); color: numberButtonColor; }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("9"); color: numberButtonColor; }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("/"); color: operationButtonColor }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; enabled: false; operation: qsTr(""); color: operationButtonColor }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("C"); color: operationButtonColor }
                }

                Row {
                    spacing: 6;

                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("4"); color: numberButtonColor; }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("5"); color: numberButtonColor; }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("6"); color: numberButtonColor; }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("*"); color: operationButtonColor }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("("); color: operationButtonColor }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr(")"); color: operationButtonColor }
                }

                Row {
                    spacing: 6;

                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("1"); color: numberButtonColor; }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("2"); color: numberButtonColor; }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("3"); color: numberButtonColor; }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("-"); color: operationButtonColor }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; enabled: false; operation: qsTr(""); color: operationButtonColor }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("√"); color: operationButtonColor }
                }

                Row {
                    spacing: 6;

                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("0"); color: numberButtonColor; }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("."); color: operationButtonColor }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("%"); color: operationButtonColor }
                    MyButton { width: columnKeyboard.buttonWidth; height: columnKeyboard.buttonHeight; operation: qsTr("+"); color: operationButtonColor }
                    MyButton { width: columnKeyboard.buttonWidth * 2 + parent.spacing; height: columnKeyboard.buttonHeight; operation: qsTr("="); color: operationButtonColor }
                }

            }

        }

    }

    Component.onCompleted: {
        console.log("---Into Component.onCompleted---")
    }

    function doOperation(operation) {
        if (operation === '.' && textFieldInput.text.search(/\./) !== -1) {
            return;
        }

        if (operation === 'C') {
            textFieldInput.clear();
        }

        if ((operation >= '0' && operation <= '9') || operation === '.') {
            textFieldInput.text += operation;
        }
    }
}
