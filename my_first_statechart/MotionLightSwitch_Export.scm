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
            "text": "MotionLightSwitch Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n\tin event switch\n\tin event changeBrightness\n\tin event toggleMode\n\tin event motionDetected\n\t\n\tvar brightness: integer"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": 577.9998779296875,
          "y": -242
        },
        "size": {
          "height": 259,
          "width": 459
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "MotionSensing",
            "fontSize": 11
          }
        },
        "id": "06ddf37a-e395-4efa-b667-7e4d19918832",
        "z": 220,
        "embeds": [
          "6973e89e-10c9-4f2d-aa0a-d9c8c756e468"
        ]
      },
      {
        "position": {
          "x": 578.9998779296875,
          "y": -198
        },
        "size": {
          "width": 457,
          "height": 214
        },
        "type": "Region",
        "attrs": {},
        "id": "6973e89e-10c9-4f2d-aa0a-d9c8c756e468",
        "z": 221,
        "embeds": [
          "b1eea11a-9c4d-444f-b462-2a9fd9ac7e63",
          "a879ac58-4780-45fa-8f3f-21ed5e07dc20",
          "8e66003d-663a-441b-9f71-11d34ccc918e",
          "be4f2010-6839-441a-bb0c-5342c98c8f0e",
          "e940215a-31da-4e88-9ce4-989da5c91048",
          "180577d3-b21f-4eb4-b44b-b76710a2b829"
        ],
        "parent": "06ddf37a-e395-4efa-b667-7e4d19918832"
      },
      {
        "position": {
          "x": 1154,
          "y": -242
        },
        "size": {
          "height": 259,
          "width": 660
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Manual",
            "fontSize": 11
          }
        },
        "id": "ed00d578-0d79-466a-9499-fc606093763c",
        "z": 259,
        "embeds": [
          "1be0827e-1489-47f2-9d84-82227a602ab5"
        ]
      },
      {
        "position": {
          "x": 1155,
          "y": -198
        },
        "size": {
          "width": 658,
          "height": 214
        },
        "type": "Region",
        "attrs": {
          "name": {
            "text": "r1"
          }
        },
        "id": "1be0827e-1489-47f2-9d84-82227a602ab5",
        "z": 260,
        "embeds": [
          "1cd170f2-b32f-4499-b72c-e331da1d5a12",
          "6fa027dc-03eb-4ca3-9bc7-aa14636958c4",
          "91529f3c-782d-4408-bc35-e0c3a2654f1e",
          "6b3f4deb-cfff-465d-9b01-11937b723d8f",
          "e425ee81-c9fb-4106-b11c-3c25d8926fb6",
          "7e8941e3-c50f-4a6f-8f8e-47e4fc119b12"
        ],
        "parent": "ed00d578-0d79-466a-9499-fc606093763c"
      },
      {
        "position": {
          "x": 1174,
          "y": -151.5
        },
        "size": {
          "height": 69,
          "width": 160
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Off",
            "fontSize": 11
          },
          "specification": {
            "text": "entry /\nbrightness = 0"
          }
        },
        "id": "6b3f4deb-cfff-465d-9b01-11937b723d8f",
        "z": 264,
        "parent": "1be0827e-1489-47f2-9d84-82227a602ab5"
      },
      {
        "position": {
          "x": 1246.5,
          "y": -38.5
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "e425ee81-c9fb-4106-b11c-3c25d8926fb6",
        "z": 265,
        "embeds": [
          "c8343cbe-2502-457e-a0ff-fe6caea46f07"
        ],
        "parent": "1be0827e-1489-47f2-9d84-82227a602ab5"
      },
      {
        "position": {
          "x": 1534,
          "y": -157
        },
        "size": {
          "height": 100,
          "width": 250
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "On",
            "fontSize": 11
          },
          "specification": {
            "text": "changeBrightness \n[brightness > 1] / brightness -= 1\nchangeBrightness \n[brightness  <= 1] / brightness = 10"
          }
        },
        "id": "7e8941e3-c50f-4a6f-8f8e-47e4fc119b12",
        "z": 266,
        "parent": "1be0827e-1489-47f2-9d84-82227a602ab5"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 1246.5,
          "y": -23.5
        },
        "attrs": {
          "label": {
            "fill": "#C5C8C6",
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "c8343cbe-2502-457e-a0ff-fe6caea46f07",
        "z": 267,
        "parent": "e425ee81-c9fb-4106-b11c-3c25d8926fb6"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e425ee81-c9fb-4106-b11c-3c25d8926fb6"
        },
        "target": {
          "id": "6b3f4deb-cfff-465d-9b01-11937b723d8f"
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
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "91529f3c-782d-4408-bc35-e0c3a2654f1e",
        "z": 268,
        "parent": "1be0827e-1489-47f2-9d84-82227a602ab5"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7e8941e3-c50f-4a6f-8f8e-47e4fc119b12",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "55%",
              "rotate": true
            }
          }
        },
        "target": {
          "id": "6b3f4deb-cfff-465d-9b01-11937b723d8f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "69.718%",
              "rotate": true
            }
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "switch"
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
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "6fa027dc-03eb-4ca3-9bc7-aa14636958c4",
        "z": 268,
        "parent": "1be0827e-1489-47f2-9d84-82227a602ab5",
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6b3f4deb-cfff-465d-9b01-11937b723d8f",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "28.873%",
              "rotate": true
            }
          }
        },
        "target": {
          "id": "7e8941e3-c50f-4a6f-8f8e-47e4fc119b12"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "switch / \nbrightness = 10"
              }
            },
            "position": {
              "distance": 0.45454545454545453,
              "offset": -20,
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
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "1cd170f2-b32f-4499-b72c-e331da1d5a12",
        "z": 268,
        "parent": "1be0827e-1489-47f2-9d84-82227a602ab5",
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "06ddf37a-e395-4efa-b667-7e4d19918832",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "62.934%",
              "rotate": true
            }
          }
        },
        "target": {
          "id": "ed00d578-0d79-466a-9499-fc606093763c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "62.934%",
              "rotate": true
            }
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "toggleMode"
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
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "6425c983-a14c-450f-92df-0394b53492d4",
        "z": 268,
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ed00d578-0d79-466a-9499-fc606093763c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "43.629%",
              "rotate": true
            }
          }
        },
        "target": {
          "id": "06ddf37a-e395-4efa-b667-7e4d19918832",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "43.629%",
              "rotate": true
            }
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "toggleMode"
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
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "01b39393-f402-4dc8-8cca-1af4f60c771e",
        "z": 268,
        "vertices": []
      },
      {
        "position": {
          "x": 625.9998779296875,
          "y": -151.5
        },
        "size": {
          "height": 69,
          "width": 131
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Off",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / \nbrightness = 0"
          }
        },
        "id": "be4f2010-6839-441a-bb0c-5342c98c8f0e",
        "z": 272,
        "parent": "6973e89e-10c9-4f2d-aa0a-d9c8c756e468"
      },
      {
        "position": {
          "x": 674.4998779296875,
          "y": -38.5
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "e940215a-31da-4e88-9ce4-989da5c91048",
        "z": 274,
        "embeds": [
          "30f37f20-f0c2-4cd5-b69f-8aa7b77066bf"
        ],
        "parent": "6973e89e-10c9-4f2d-aa0a-d9c8c756e468"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 674.4998779296875,
          "y": -23.5
        },
        "attrs": {
          "label": {
            "fill": "#C5C8C6",
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "30f37f20-f0c2-4cd5-b69f-8aa7b77066bf",
        "z": 275,
        "parent": "e940215a-31da-4e88-9ce4-989da5c91048"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e940215a-31da-4e88-9ce4-989da5c91048"
        },
        "target": {
          "id": "be4f2010-6839-441a-bb0c-5342c98c8f0e"
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
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "8e66003d-663a-441b-9f71-11d34ccc918e",
        "z": 276,
        "parent": "6973e89e-10c9-4f2d-aa0a-d9c8c756e468"
      },
      {
        "position": {
          "x": 786,
          "y": -303
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "5527bc8f-a86d-47d5-88b8-43c6e5fdff66",
        "z": 282,
        "embeds": [
          "4b9dd45a-a50b-4390-bcb4-0251a87feef3"
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
          "x": 786,
          "y": -288
        },
        "attrs": {
          "label": {
            "fill": "#C5C8C6",
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "4b9dd45a-a50b-4390-bcb4-0251a87feef3",
        "z": 283,
        "parent": "5527bc8f-a86d-47d5-88b8-43c6e5fdff66"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5527bc8f-a86d-47d5-88b8-43c6e5fdff66"
        },
        "target": {
          "id": "06ddf37a-e395-4efa-b667-7e4d19918832"
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
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "dd989eed-be4c-47e4-886a-f737c4fb507e",
        "z": 284,
        "vertices": [
          {
            "x": 794,
            "y": -254
          }
        ]
      },
      {
        "position": {
          "x": 878.9998779296875,
          "y": -151.5
        },
        "size": {
          "height": 69,
          "width": 124
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "On",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / \nbrightness = 1"
          }
        },
        "id": "180577d3-b21f-4eb4-b44b-b76710a2b829",
        "z": 286,
        "embeds": [
          "7b0cedc4-cd55-4ac4-a250-8b8092ec5adc"
        ],
        "parent": "6973e89e-10c9-4f2d-aa0a-d9c8c756e468"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "be4f2010-6839-441a-bb0c-5342c98c8f0e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "27.867%",
              "rotate": true
            }
          }
        },
        "target": {
          "id": "180577d3-b21f-4eb4-b44b-b76710a2b829"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "motionDetected"
              }
            },
            "position": {
              "distance": 0.4934605350579087,
              "offset": -10.912901964087483,
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
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "b1eea11a-9c4d-444f-b462-2a9fd9ac7e63",
        "z": 287,
        "parent": "6973e89e-10c9-4f2d-aa0a-d9c8c756e468",
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "180577d3-b21f-4eb4-b44b-b76710a2b829",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50%",
              "dy": "80.328%",
              "rotate": true
            }
          }
        },
        "target": {
          "id": "be4f2010-6839-441a-bb0c-5342c98c8f0e"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "after 30s"
              }
            },
            "position": {}
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
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "a879ac58-4780-45fa-8f3f-21ed5e07dc20",
        "z": 287,
        "parent": "6973e89e-10c9-4f2d-aa0a-d9c8c756e468",
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "180577d3-b21f-4eb4-b44b-b76710a2b829"
        },
        "target": {
          "id": "180577d3-b21f-4eb4-b44b-b76710a2b829"
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "motionDetected"
              }
            },
            "position": {
              "distance": 0.6301749342320884,
              "offset": -16,
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
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "id": "7b0cedc4-cd55-4ac4-a250-8b8092ec5adc",
        "z": 287,
        "parent": "180577d3-b21f-4eb4-b44b-b76710a2b829",
        "vertices": [
          {
            "x": 1022,
            "y": -110.5
          },
          {
            "x": 1022,
            "y": -68.5
          },
          {
            "x": 987,
            "y": -55.5
          },
          {
            "x": 930,
            "y": -55.5
          }
        ]
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
          "moduleName": "MotionLightSwitch",
          "statemachinePrefix": "motionLightSwitch",
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