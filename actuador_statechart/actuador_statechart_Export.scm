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
            "text": "actuador_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\r\n@SuperSteps(no)\r\n\r\ninterface:\r\n    in event EV_ACT_WELCOME\r\n    in event EV_ACT_PRINT_TICKET\r\n    in event EV_ACT_OPEN_BARRIER\r\n    in event EV_ACT_CLOSE_BARRIER\r\n\r\n    in event tick"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -260,
          "y": -140
        },
        "size": {
          "width": 230,
          "height": 140
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACYT_WELCOME",
            "fontSize": 11
          }
        },
        "id": "fbb81ddf-4055-489e-a04b-46346c30dc7d",
        "z": 24
      },
      {
        "position": {
          "x": -260,
          "y": 70
        },
        "size": {
          "height": 140,
          "width": 230
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_PRINTING",
            "fontSize": 11
          }
        },
        "id": "99a340c4-b963-415a-97c3-4c91e2526021",
        "z": 34
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "fbb81ddf-4055-489e-a04b-46346c30dc7d"
        },
        "target": {
          "id": "99a340c4-b963-415a-97c3-4c91e2526021",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "52.174%",
              "dy": "7.143%",
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
                "text": "EV_ACT_PRINT_TICKET"
              }
            },
            "position": {
              "offset": -65,
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
        "id": "978687df-fd6c-4c4e-a4a2-11bb15723fbf",
        "z": 35,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -260,
          "y": -330
        },
        "size": {
          "height": 140,
          "width": 230
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_IDLE",
            "fontSize": 11
          }
        },
        "id": "73b6dea1-a596-440c-855f-e37420604195",
        "z": 36
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "73b6dea1-a596-440c-855f-e37420604195"
        },
        "target": {
          "id": "fbb81ddf-4055-489e-a04b-46346c30dc7d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "52.174%",
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
                "text": "EV_ACT_WELCOME"
              }
            },
            "position": {
              "offset": -45,
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
        "id": "3f7a15a1-e0f9-48a0-aa47-26467492d72c",
        "z": 37,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -200,
          "y": -400
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "f4fc6594-8f8b-47ea-946f-6b1cb3f11d9f",
        "z": 38,
        "embeds": [
          "ba4bdde8-6888-4965-8c51-efdaf59d396e"
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
          "x": -200,
          "y": -385
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "ba4bdde8-6888-4965-8c51-efdaf59d396e",
        "z": 39,
        "parent": "f4fc6594-8f8b-47ea-946f-6b1cb3f11d9f"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f4fc6594-8f8b-47ea-946f-6b1cb3f11d9f"
        },
        "target": {
          "id": "73b6dea1-a596-440c-855f-e37420604195",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "56.522%",
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
        "id": "17f9ba8e-25c1-485d-988b-02a211a16cd9",
        "z": 40,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -260,
          "y": 280
        },
        "size": {
          "height": 140,
          "width": 230
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_BARRIER_OPEN",
            "fontSize": 11
          }
        },
        "id": "905279ba-36a6-43ae-8c96-1f1aeaa1274a",
        "z": 43
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "99a340c4-b963-415a-97c3-4c91e2526021"
        },
        "target": {
          "id": "905279ba-36a6-43ae-8c96-1f1aeaa1274a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "52.174%",
              "dy": "7.143%",
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
                "text": "EV_ACT_OPEN_BARRIER"
              }
            },
            "position": {
              "offset": -65,
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
        "id": "1c3c35f5-00d1-4aee-b022-a2d4d836b07a",
        "z": 44,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -260,
          "y": 510
        },
        "size": {
          "height": 140,
          "width": 230
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_BARRIER_CLOSED",
            "fontSize": 11
          }
        },
        "id": "5b4524c0-cfa3-4e87-89e4-0a1f46fc06ae",
        "z": 47
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "905279ba-36a6-43ae-8c96-1f1aeaa1274a"
        },
        "target": {
          "id": "5b4524c0-cfa3-4e87-89e4-0a1f46fc06ae",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "47.826%",
              "dy": "7.143%",
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
                "text": "EV_ACT_CLOSE_BARRIER"
              }
            },
            "position": {
              "offset": -65,
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
        "id": "629e56b7-8f00-4e40-bba4-a8c9afa0c11f",
        "z": 48,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5b4524c0-cfa3-4e87-89e4-0a1f46fc06ae"
        },
        "target": {
          "id": "73b6dea1-a596-440c-855f-e37420604195",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "4.348%",
              "dy": "42.857%",
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
                "text": "EV_ACT_CLOSE_BARRIER"
              }
            },
            "position": {
              "distance": 0.5147878543729882,
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
        "id": "c6b35fb3-299f-48d6-a65c-1bf2c994a238",
        "z": 49,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -430,
            "y": 570
          },
          {
            "x": -520,
            "y": 170
          },
          {
            "x": -520,
            "y": 90
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
          "moduleName": "ActuadorAtatechart",
          "statemachinePrefix": "actuadorAtatechart",
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