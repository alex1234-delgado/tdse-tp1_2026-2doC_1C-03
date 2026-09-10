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
            "text": "actuator_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    in event EV_ACT_OPEN_BARRIER\n    in event EV_ACT_CLOSE_BARRIER\n    in event tick\n\n    operation LED1_ON()\n    operation LED1_OFF()\n    operation LED2_ON()\n    operation LED2_OFF()\n    operation LED1_TOGGLE()\n    operation LED2_TOGGLE()\n\ninternal:\n    var DEL_ACT_TRANSITION : integer = 0\n    var DEL_LED_BLINK : integer = 0\n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -85,
          "y": 137
        },
        "size": {
          "width": 96,
          "height": 91
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_ON",
            "fontSize": 11
          }
        },
        "id": "1d3a9f86-caad-4929-9daa-23055c279412",
        "z": 26
      },
      {
        "position": {
          "x": 193,
          "y": -235
        },
        "size": {
          "width": 180,
          "height": 124
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_TRANSITION_OPEN",
            "fontSize": 11
          }
        },
        "id": "e2c22509-d256-43e0-aec8-7b7c65853b03",
        "z": 32,
        "embeds": [
          "5638f928-fb8d-4d1a-a143-3d234657f1d6",
          "1ca80bcc-41da-4ada-9ae5-366ef57e10d4"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e2c22509-d256-43e0-aec8-7b7c65853b03"
        },
        "target": {
          "id": "1d3a9f86-caad-4929-9daa-23055c279412",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.042%",
              "dy": "35.165%",
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
                "text": "tick [DEL_ACT_TRANSITION == 1] /\nLED1_OFF;\nLED2_OFF;\nDEL_ACT_TRANSITION = 0"
              }
            },
            "position": {
              "distance": 0.4924934650783984,
              "offset": -109.8382568359375,
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
        "id": "bf3597e6-4aa3-4fa3-b0b0-e1578477afb2",
        "z": 33,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 283,
            "y": -5
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e2c22509-d256-43e0-aec8-7b7c65853b03"
        },
        "target": {
          "id": "e2c22509-d256-43e0-aec8-7b7c65853b03",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "39.516%",
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
                "text": "tick [DEL_LED_BLINK == 1 && DEL_ACT_TRANSITION > 1] /\nLED1_TOGGLE;\nLED2_TOGGLE;\nDEL_LED_BLINK = 100;\nDEL_ACT_TRANSITION--"
              }
            },
            "position": {
              "distance": 0.2919539823819313,
              "offset": 35,
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
        "id": "1ca80bcc-41da-4ada-9ae5-366ef57e10d4",
        "z": 39,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 241,
            "y": -26
          },
          {
            "x": -93,
            "y": -26
          }
        ],
        "parent": "e2c22509-d256-43e0-aec8-7b7c65853b03"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e2c22509-d256-43e0-aec8-7b7c65853b03",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "70.556%",
              "dy": "98.387%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "e2c22509-d256-43e0-aec8-7b7c65853b03",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.889%",
              "dy": "43.548%",
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
                "text": "tick [DEL_ACT_TRANSITION > 1 && DEL_LED_BLINK > 1] /\nDEL_ACT_TRANSITION--;\nDEL_LED_BLINK--"
              }
            },
            "position": {
              "distance": 0.2954252309524656,
              "offset": -39.38468933105469,
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
        "id": "5638f928-fb8d-4d1a-a143-3d234657f1d6",
        "z": 40,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 656,
            "y": -29
          }
        ],
        "parent": "e2c22509-d256-43e0-aec8-7b7c65853b03"
      },
      {
        "position": {
          "x": -732,
          "y": -227
        },
        "size": {
          "width": 188,
          "height": 128
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_TRANSITION_CLOSE",
            "fontSize": 11
          }
        },
        "id": "88a36b0c-e292-486e-9b4c-8209eafa49dd",
        "z": 41,
        "embeds": [
          "3f54f499-5323-449a-8632-a32506755cf4",
          "d0b70205-4dca-4632-9f13-11af0c62129f"
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1d3a9f86-caad-4929-9daa-23055c279412"
        },
        "target": {
          "id": "88a36b0c-e292-486e-9b4c-8209eafa49dd",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "47.34%",
              "dy": "93.75%",
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
                "text": "EV_ACT_CLOSE_BARRIER /\nLED1_ON;\nLED2_OFF;\nDEL_ACT_TRANSITION = 1500;\nDEL_LED_BLINK = 100"
              }
            },
            "position": {
              "distance": 0.30179806578247703,
              "offset": 38.3030943156906,
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
        "id": "7ab1c7c8-0f4c-4113-aea4-7b21aec15ad0",
        "z": 42,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "88a36b0c-e292-486e-9b4c-8209eafa49dd"
        },
        "target": {
          "id": "88a36b0c-e292-486e-9b4c-8209eafa49dd",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "27.344%",
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
                "text": "tick [DEL_ACT_TRANSITION > 1 && DEL_LED_BLINK > 1] /\nDEL_ACT_TRANSITION--;\nDEL_LED_BLINK--"
              }
            },
            "position": {
              "distance": 0.305489437014667,
              "offset": 81.38468766212463,
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
        "id": "d0b70205-4dca-4632-9f13-11af0c62129f",
        "z": 42,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -670,
            "y": -44
          },
          {
            "x": -1101,
            "y": -44
          }
        ],
        "parent": "88a36b0c-e292-486e-9b4c-8209eafa49dd"
      },
      {
        "position": {
          "x": -286,
          "y": -456
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "19a65da8-a2ec-4ff8-91b4-72cb6d794f44",
        "z": 43,
        "embeds": [
          "3100c78f-c399-4bb0-ba91-a240879a34c9"
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
          "x": -286,
          "y": -441
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "3100c78f-c399-4bb0-ba91-a240879a34c9",
        "z": 44,
        "parent": "19a65da8-a2ec-4ff8-91b4-72cb6d794f44"
      },
      {
        "position": {
          "x": -223,
          "y": -366
        },
        "size": {
          "width": 93,
          "height": 87
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_OFF",
            "fontSize": 11
          }
        },
        "id": "c1eb1995-5913-444d-bd94-085e6e83074b",
        "z": 48
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "88a36b0c-e292-486e-9b4c-8209eafa49dd"
        },
        "target": {
          "id": "c1eb1995-5913-444d-bd94-085e6e83074b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "8.602%",
              "dy": "31.034%",
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
                "text": "tick [DEL_ACT_TRANSITION == 1] /\nLED1_ON;\nLED2_ON;\nDEL_ACT_TRANSITION = 0"
              }
            },
            "position": {
              "distance": 0.5554248643612923,
              "offset": -26,
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
        "id": "6a40f8a9-d22e-4f28-aa55-0e4e58b59aee",
        "z": 49,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -340,
            "y": -339
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "19a65da8-a2ec-4ff8-91b4-72cb6d794f44"
        },
        "target": {
          "id": "c1eb1995-5913-444d-bd94-085e6e83074b",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.462%",
              "dy": "12.644%",
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
        "id": "9c54682b-e0d7-4a8b-84be-eb6bac065689",
        "z": 49,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c1eb1995-5913-444d-bd94-085e6e83074b"
        },
        "target": {
          "id": "e2c22509-d256-43e0-aec8-7b7c65853b03",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "44.444%",
              "dy": "5.645%",
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
                "text": "EV_ACT_OPEN_BARRIER /\nLED1_OFF;\nLED2_ON;\nDEL_ACT_TRANSITION = 1500;\nDEL_LED_BLINK = 100"
              }
            },
            "position": {
              "distance": 0.5400570507212406,
              "offset": -37.02741531535282,
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
        "id": "b072f997-ee67-4896-9caf-68a183702414",
        "z": 49,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 273,
            "y": -322.5
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "88a36b0c-e292-486e-9b4c-8209eafa49dd",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "75.532%",
              "dy": "100%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "88a36b0c-e292-486e-9b4c-8209eafa49dd",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.936%",
              "dy": "39.844%",
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
                "text": "tick [DEL_LED_BLINK == 1 && DEL_ACT_TRANSITION > 1] /\nLED1_TOGGLE;\nLED2_TOGGLE;\nDEL_LED_BLINK = 100;\nDEL_ACT_TRANSITION--"
              }
            },
            "position": {
              "distance": 0.30199577852151,
              "offset": -39.38468933105469,
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
        "id": "3f54f499-5323-449a-8632-a32506755cf4",
        "z": 50,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -209,
            "y": -31
          }
        ],
        "parent": "88a36b0c-e292-486e-9b4c-8209eafa49dd"
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
          "moduleName": "MyStatechart",
          "statemachinePrefix": "myStatechart",
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