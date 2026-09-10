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
            "text": "System_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\r\n@SuperSteps(no)\r\n\r\ninterface:\r\n    in event EV_SYS_CAR_ARRIVES\r\n    in event EV_SYS_CAR_LEAVES\r\n    in event EV_SYS_BTN_DOWN\r\n    in event EV_SYS_BTN_UP\r\n\r\n    out event EV_ACT_WELCOME\r\n    out event EV_ACT_PRINT_TICKET\r\n    out event EV_ACT_OPEN_BARRIER\r\n    out event EV_ACT_CLOSE_BARRIER\r\n    out event EV_ACT_CAR_INSIDE\r\n    "
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -220,
          "y": -300
        },
        "size": {
          "height": 230,
          "width": 250
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_IDLE",
            "fontSize": 11
          }
        },
        "id": "1032ea75-399e-4c2b-ad91-9b62b66928d9",
        "z": 2
      },
      {
        "position": {
          "x": -220,
          "y": 60
        },
        "size": {
          "height": 230,
          "width": 250
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_WAIT_BUTTON",
            "fontSize": 11
          }
        },
        "id": "4f125e28-c50e-4aad-aa7b-37f1952684a4",
        "z": 16
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1032ea75-399e-4c2b-ad91-9b62b66928d9"
        },
        "target": {
          "id": "4f125e28-c50e-4aad-aa7b-37f1952684a4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "48%",
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
                "text": "EV_SYS_CAR_ARRIVES /\nraise EV_ACT_WELCOME"
              }
            },
            "position": {
              "offset": -75,
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
        "id": "b69b9b65-012b-42ba-9c8a-665992d8567e",
        "z": 17,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -150,
          "y": -390
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "891a5748-0578-42e8-b607-ffcd70168bed",
        "z": 19,
        "embeds": [
          "bd66c9d9-d301-4185-b857-2c32e098fa92"
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
          "x": -150,
          "y": -375
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "bd66c9d9-d301-4185-b857-2c32e098fa92",
        "z": 20,
        "parent": "891a5748-0578-42e8-b607-ffcd70168bed"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "891a5748-0578-42e8-b607-ffcd70168bed"
        },
        "target": {
          "id": "1032ea75-399e-4c2b-ad91-9b62b66928d9",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "52%",
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
        "id": "41a3f540-d9c0-4687-8555-c1a664d2077e",
        "z": 21,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -220,
          "y": 450
        },
        "size": {
          "height": 230,
          "width": 250
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_WAIT_CAR_LEAVES",
            "fontSize": 11
          }
        },
        "id": "ce9b012e-9213-4000-92d3-fa909f26ac9e",
        "z": 24
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4f125e28-c50e-4aad-aa7b-37f1952684a4"
        },
        "target": {
          "id": "ce9b012e-9213-4000-92d3-fa909f26ac9e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "48%",
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
                "text": "EV_SYS_BTN_DOWN /\r\nraise EV_ACT_PRINT_TICKET;\r\nraise EV_ACT_OPEN_BARRIER"
              }
            },
            "position": {
              "offset": -85,
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
        "id": "0218cbb6-e79b-4dc0-bbc3-7eb7e483f9a3",
        "z": 25,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -220,
          "y": 810
        },
        "size": {
          "height": 230,
          "width": 250
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_CAR_INSIDE",
            "fontSize": 11
          }
        },
        "id": "92582029-d4e7-4c28-975b-91f348388550",
        "z": 26
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ce9b012e-9213-4000-92d3-fa909f26ac9e"
        },
        "target": {
          "id": "92582029-d4e7-4c28-975b-91f348388550",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "52%",
              "dy": "4.348%",
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
                "text": "EV_SYS_CAR_LEAVES /\r\nraise EV_ACT_CLOSE_BARRIER;\r\nraise EV_ACT_CAR_INSIDE"
              }
            },
            "position": {
              "distance": 0.5769230769230769,
              "offset": -85,
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
        "id": "12a37d88-1cff-4243-8c3c-38d33e2f067c",
        "z": 27,
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
          "moduleName": "SystemStatechartExport",
          "statemachinePrefix": "systemStatechartExport",
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