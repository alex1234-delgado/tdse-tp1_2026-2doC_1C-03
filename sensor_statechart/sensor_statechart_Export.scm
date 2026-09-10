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
            "text": "@EventDriven\r\n@SuperSteps(no)\r\n\r\ninterface:\r\n    in event EV_BTN_UP\r\n    in event EV_BTN_DOWN\r\n    in event tick\r\n\r\n    out event EV_SYS_BTN_UP\r\n    out event EV_SYS_BTN_DOWN\r\n\r\n    var DEL_BTN_DEBOUNCE : integer = 0"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -40,
          "y": 1050
        },
        "size": {
          "height": 120,
          "width": 140
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_RISING",
            "fontSize": 11
          }
        },
        "id": "c9847c50-dc72-44d2-8386-9481fbdf86e5",
        "z": 76,
        "embeds": [
          "e2020032-f17f-4e9e-86cb-ed94f962b876"
        ]
      },
      {
        "position": {
          "x": -40,
          "y": 640
        },
        "size": {
          "height": 120,
          "width": 140
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_FALLING",
            "fontSize": 11
          }
        },
        "id": "124dfe15-245e-498f-ae37-b7000afebe10",
        "z": 101,
        "embeds": [
          "4a021abc-b0a7-4201-8597-31242bcd5c1c"
        ]
      },
      {
        "position": {
          "x": -40,
          "y": 840
        },
        "size": {
          "height": 120,
          "width": 140
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_DOWN",
            "fontSize": 11
          }
        },
        "id": "8a309cff-84b4-435c-972d-9ee262bad723",
        "z": 104,
        "embeds": []
      },
      {
        "position": {
          "x": 20,
          "y": 410
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "b338da53-46f2-4631-b8c5-326ba8986aaf",
        "z": 106,
        "embeds": [
          "09d1d7aa-c69f-4990-8213-e961dec00e1f"
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
          "x": 20,
          "y": 425
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "09d1d7aa-c69f-4990-8213-e961dec00e1f",
        "z": 107,
        "parent": "b338da53-46f2-4631-b8c5-326ba8986aaf"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9847c50-dc72-44d2-8386-9481fbdf86e5"
        },
        "target": {
          "id": "c9847c50-dc72-44d2-8386-9481fbdf86e5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "100%",
              "dy": "83.333%",
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
                "text": "tick [DEL_BTN_DEBOUNCE > 1] / \nDEL_BTN_DEBOUNCE--"
              }
            },
            "position": {
              "offset": -95,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "e2020032-f17f-4e9e-86cb-ed94f962b876",
        "z": 109,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 130,
            "y": 1080
          },
          {
            "x": 150,
            "y": 1110
          },
          {
            "x": 150,
            "y": 1130
          },
          {
            "x": 130,
            "y": 1150
          }
        ],
        "parent": "c9847c50-dc72-44d2-8386-9481fbdf86e5"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8a309cff-84b4-435c-972d-9ee262bad723"
        },
        "target": {
          "id": "c9847c50-dc72-44d2-8386-9481fbdf86e5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "28.571%",
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
                "text": "EV_BTN_UP / \nDEL_BTN_DEBOUNCE = 50"
              }
            },
            "position": {
              "offset": 75,
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
        "id": "ee868172-6a62-4741-a8f6-636eeb815c42",
        "z": 113,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9847c50-dc72-44d2-8386-9481fbdf86e5"
        },
        "target": {
          "id": "8a309cff-84b4-435c-972d-9ee262bad723",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "64.286%",
              "dy": "100%",
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
                "text": "EV_BTN_DOWN / \nDEL_BTN_DEBOUNCE = 0"
              }
            },
            "position": {
              "offset": 65,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
        "id": "f4a40e27-844e-4fab-916e-9917ddc01c6d",
        "z": 114,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "124dfe15-245e-498f-ae37-b7000afebe10"
        },
        "target": {
          "id": "8a309cff-84b4-435c-972d-9ee262bad723",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "35.714%",
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
                "text": "tick [DEL_BTN_DEBOUNCE == 1] /\r\nDEL_BTN_DEBOUNCE = 0;\r\nraise EV_SYS_BTN_DOWN"
              }
            },
            "position": {
              "distance": 0.609375,
              "offset": -95,
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
        "id": "9999998f-8c93-4a4d-af3a-6c0219e0c10c",
        "z": 115,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 10,
            "y": 800
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "124dfe15-245e-498f-ae37-b7000afebe10"
        },
        "target": {
          "id": "124dfe15-245e-498f-ae37-b7000afebe10",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "100%",
              "dy": "25%",
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
                "text": "tick [DEL_BTN_DEBOUNCE > 1] / \nDEL_BTN_DEBOUNCE--"
              }
            },
            "position": {
              "offset": 95,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
        "id": "4a021abc-b0a7-4201-8597-31242bcd5c1c",
        "z": 116,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 140,
            "y": 740
          },
          {
            "x": 140,
            "y": 710
          }
        ],
        "parent": "124dfe15-245e-498f-ae37-b7000afebe10"
      },
      {
        "position": {
          "x": -40,
          "y": 469
        },
        "size": {
          "height": 120,
          "width": 140
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_UP",
            "fontSize": 11
          }
        },
        "id": "422692f4-3079-4b2e-9412-4081a6faf7da",
        "z": 119,
        "embeds": [
          "253d0559-2f0d-4665-8f9a-3ce73d2bbc34"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "b338da53-46f2-4631-b8c5-326ba8986aaf"
        },
        "target": {
          "id": "422692f4-3079-4b2e-9412-4081a6faf7da",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
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
        "id": "1c56a5ee-253c-40f3-8a90-57176c65ed4e",
        "z": 120,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "124dfe15-245e-498f-ae37-b7000afebe10",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "71.429%",
              "dy": "0%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "422692f4-3079-4b2e-9412-4081a6faf7da",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "71.429%",
              "dy": "100%",
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
                "text": "EV_BTN_UP / \nDEL_BTN_DEBOUNCE = 0"
              }
            },
            "position": {
              "distance": 0.548094482421875,
              "offset": 65.07637023925781,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "cbc7b504-e637-4c70-bef7-2a0061c46429",
        "z": 120,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c9847c50-dc72-44d2-8386-9481fbdf86e5"
        },
        "target": {
          "id": "422692f4-3079-4b2e-9412-4081a6faf7da",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "50%",
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
                "text": "tick [DEL_BTN_DEBOUNCE == 1] /\r\nDEL_BTN_DEBOUNCE = 0;\r\nraise EV_SYS_BTN_UP"
              }
            },
            "position": {
              "distance": 0.5103859190055776,
              "offset": 105,
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
        "id": "d337ca14-a8c3-42cb-9776-a0b50086e0d6",
        "z": 120,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -300,
            "y": 1120
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "422692f4-3079-4b2e-9412-4081a6faf7da"
        },
        "target": {
          "id": "124dfe15-245e-498f-ae37-b7000afebe10",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "28.571%",
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
                "text": "EV_BTN_DOWN / DEL_BTN_DEBOUNCE = 50"
              }
            },
            "position": {
              "offset": 115,
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
        "id": "a98b3517-c270-4357-ace0-b38017bf4f68",
        "z": 120,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "422692f4-3079-4b2e-9412-4081a6faf7da",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "100%",
              "dy": "83.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "422692f4-3079-4b2e-9412-4081a6faf7da",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "92.857%",
              "dy": "25%",
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
                "text": "EV_BTN_UP"
              }
            },
            "position": {
              "offset": 55,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "253d0559-2f0d-4665-8f9a-3ce73d2bbc34",
        "z": 120,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 130,
            "y": 569
          },
          {
            "x": 130,
            "y": 499
          }
        ],
        "parent": "422692f4-3079-4b2e-9412-4081a6faf7da"
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