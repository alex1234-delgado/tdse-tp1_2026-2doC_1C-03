{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "sensor_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    in event in_raw_pressed\n    in event in_raw_released\n    out event EV_BTN_PRESSED\n    out event EV_BTN_RELEASED\n    var tick : integer = 0\n    const DEL_BTN_NAME : integer = 20"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -30,
          "y": 450
        },
        "size": {
          "height": 98,
          "width": 97
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "BUTTON_FALLING",
            "fontSize": 11
          }
        },
        "id": "94b522eb-31d9-4784-b7e2-ee0503063a51",
        "z": 43
      },
      {
        "position": {
          "x": -30,
          "y": 690
        },
        "size": {
          "height": 96,
          "width": 93
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "BUTTON_DOWN",
            "fontSize": 11
          }
        },
        "id": "4a477e98-29a7-48b0-a8ee-725dace67cb0",
        "z": 50
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "94b522eb-31d9-4784-b7e2-ee0503063a51"
        },
        "target": {
          "id": "4a477e98-29a7-48b0-a8ee-725dace67cb0",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "64.516%",
              "dy": "0%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "after (DEL_BTN_NAME) ms / raise EV_BTN_PRESSED"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "50e228e4-61e3-4288-949a-60a85571a25d",
        "z": 51,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 30,
            "y": 570
          }
        ]
      },
      {
        "position": {
          "x": -300,
          "y": 690
        },
        "size": {
          "height": 94,
          "width": 89
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "BUTTON_RISING",
            "fontSize": 11
          }
        },
        "id": "f0506aa0-9b18-4992-a113-63eba6ad1667",
        "z": 52
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4a477e98-29a7-48b0-a8ee-725dace67cb0"
        },
        "target": {
          "id": "f0506aa0-9b18-4992-a113-63eba6ad1667",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "11.236%",
              "dy": "46.809%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "in_raw_released / tick = 0"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "c007d0c2-1961-4b25-8b98-41702489c605",
        "z": 53,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -290,
          "y": 450
        },
        "size": {
          "height": 99,
          "width": 91
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "BUTTON_UP",
            "fontSize": 11
          }
        },
        "id": "deea140b-01ae-4fa3-95ce-5f13ece54024",
        "z": 56
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f0506aa0-9b18-4992-a113-63eba6ad1667"
        },
        "target": {
          "id": "deea140b-01ae-4fa3-95ce-5f13ece54024",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "43.956%",
              "dy": "90.909%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "after (DEL_BTN_NAME) ms / raise EV_BTN_RELEASED"
              }
            },
            "position": {
              "distance": 0.4946157764164715,
              "offset": -35.000000000000014,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "86a410f1-6feb-40bd-92ed-e5da08676820",
        "z": 57,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "deea140b-01ae-4fa3-95ce-5f13ece54024"
        },
        "target": {
          "id": "94b522eb-31d9-4784-b7e2-ee0503063a51",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "14.433%",
              "dy": "40.816%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "in_raw_pressed / tick = 0"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "682b82f9-515b-49ee-b98a-6fb0a31a923b",
        "z": 57,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -370,
          "y": 490
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "ae3a986b-a9ab-4b55-8b44-1641b6827c9f",
        "z": 58,
        "embeds": [
          "72e59e93-bb22-42bf-a374-9c1b88cf2442"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -370,
          "y": 505
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "72e59e93-bb22-42bf-a374-9c1b88cf2442",
        "z": 59,
        "parent": "ae3a986b-a9ab-4b55-8b44-1641b6827c9f"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ae3a986b-a9ab-4b55-8b44-1641b6827c9f"
        },
        "target": {
          "id": "deea140b-01ae-4fa3-95ce-5f13ece54024",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "48.485%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "b2645b83-4977-418b-96e5-ac05607152a8",
        "z": 60,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "SensorStatechart",
          "statemachinePrefix": "sensorStatechart",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}