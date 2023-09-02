local M = {}

M.dashboard = function()
  math.randomseed(os.time())
  local headers = {
    {
      [[                                                            ]],
      [[                     █▒               ▒█                    ]],
      [[                     ███▒           ▒███                    ]],
      [[                     █████▒       ▒█████                    ]],
      [[                    █████████████████████                   ]],
      [[                   ██▒     ▒█████▒     ▒██                  ]],
      [[                   █▒    █   ▒█▒   █    ▒█                  ]],
      [[                  █▒     █    █    █     ▒█                 ]],
      [[                  █▒     █    █    █     ▒█                 ]],
      [[                  █▒     █    █    █     ▒█                 ]],
      [[           ▄▄▄▄▄▄▄██▒    █   ▒█▒   █    ▒██▄▄▄▄▄▄▄          ]],
      [[             ▄▄▄▄▄▄███▒    ▒█████▒    ▒███▄▄▄▄▄▄            ]],
      [[               ▄▄▄▄▄▄█████████▒█████████▄▄▄▄▄▄              ]],
      [[                          ▒███████▒                         ]],
      [[                                                            ]],
    },
    {
      [[                                                            ]],
      [[                                                            ]],
      [[                        .-. \_/ .-.                         ]],
      [[                        \.-\/=\/.-/                         ]],
      [[                     '-./___|=|___\.-'                      ]],
      [[                    .--| \|/`"`\|/ |--.                     ]],
      [[                   (((_)\  .---.  /(_)))                    ]],
      [[                    `\ \_`-.   .-'_/ /`_                    ]],
      [[                      '.__       __.'(_))                   ]],
      [[                          /     \     //                    ]],
      [[                         |       |__.'/                     ]],
      [[                         \       /--'`                      ]],
      [[                     .--,-' .--. '----.                     ]],
      [[                    '----`--'  '--`----'                    ]],
      [[                                                            ]],
    },
    {
      [[                                                            ]],
      [[                                                            ]],
      [[             _==/          i     i          \==_            ]],
      [[           /XX/            |\___/|            \XX\          ]],
      [[         /XXXX\            |XXXXX|            /XXXX\        ]],
      [[        |XXXXXX\_         _XXXXXXX_         _/XXXXXX|       ]],
      [[       XXXXXXXXXXXxxxxxxxXXXXXXXXXXXxxxxxxxXXXXXXXXXXX      ]],
      [[      |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|     ]],
      [[      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX     ]],
      [[      |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|     ]],
      [[       XXXXXX/^^^^"\XXXXXXXXXXXXXXXXXXXXX/^^^^^\XXXXXX      ]],
      [[        |XXX|       \XXX/^^\XXXXX/^^\XXX/       |XXX|       ]],
      [[          \XX\       \X/    \XXX/    \X/       /XX/         ]],
      [[             "\       "      \X/      "      /"             ]],
      [[                                                            ]],
    },
    {
      [[                                                            ]],
      [[                                                            ]],
      [[                                                            ]],
      [[                                                            ]],
      [[                                                            ]],
      [[                     ▀████▀▄▄              ▄█               ]],
      [[                       █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█               ]],
      [[               ▄        █          ▀▀▀▀▄  ▄▀                ]],
      [[              ▄▀ ▀▄      ▀▄              ▀▄▀                ]],
      [[             ▄▀    █     █▀   ▄█▀▄      ▄█                  ]],
      [[             ▀▄     ▀▄  █     ▀██▀     ██▄█                 ]],
      [[              ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █                ]],
      [[               █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀                ]],
      [[              █   █  █      ▄▄           ▄▀                 ]],
      [[                                                            ]],
    },
    {
      [[                          ▄▄████▄▄                          ]],
      [[                        ▄██████████▄                        ]],
      [[                      ▄██▄██▄██▄██▄██▄                      ]],
      [[                        ▀█▀  ▀▀  ▀█▀                        ]],
      [[                                                            ]],
      [[    ▀▄   ▄▀     ▄ ▀▄   ▄▀ ▄       ▀▄   ▄▀        ▀▄   ▄▀    ]],
      [[   ▄█▀███▀█▄    █▄███████▄█      ▄█▀███▀█▄      ▄█▀███▀█▄   ]],
      [[  █▀███████▀█   ███▄███▄███     █▀███████▀█    █▀███████▀█  ]],
      [[  █ █▀▀▀▀▀█ █   ▀█████████▀     █ █▀▀▀▀▀█ █    █ █▀▀▀▀▀█ █  ]],
      [[     ▀▀ ▀▀       ▄▀     ▀▄         ▀▀ ▀▀          ▀▀ ▀▀     ]],
      [[     ▄██▄         ▄▄████▄▄          ▄██▄         ▄▄████▄▄   ]],
      [[   ▄██████▄      ██████████       ▄██████▄      ██████████  ]],
      [[  ███▄██▄███     ██▄▄██▄▄██      ███▄██▄███     ██▄▄██▄▄██  ]],
      [[    ▄▀▄▄▀▄        ▄▀▄▀▀▄▀▄         ▄▀▄▄▀▄        ▄▀▄▀▀▄▀▄   ]],
      [[   ▀ ▀  ▀ ▀      ▀        ▀       ▀ ▀  ▀ ▀      ▀        ▀  ]],
    },
    {
      [[                                                            ]],
      [[                          ▄▄▄▄▄▄▄▄▄                         ]],
      [[                        ▒███████████▒                       ]],
      [[                ▒████▄  ▀███▄   ▄███▀  ▄████▒               ]],
      [[                ▐██▒███▄  ▀███▄███▀  ▄███▒██▌               ]],
      [[                 ▒██▄▀███▄  ▀███▀  ▄███▀▄██▒                ]],
      [[                 ▐█▄▀█▄▀██▒ ▄ ▀ ▄ ▒██▀▄█▀▄█▌                ]],
      [[                  ▒██▄▀███▒ ██▄██ ▒███▀▄██▒                 ]],
      [[                    ▀▀▀▀▀▀   █▒█   ▀▀▀▀▀▀▀                  ]],
      [[                  ▒█▄     ▄█ █▒█ █▄     ▄█▒                 ]],
      [[                   ▀█▒█ █▒█████████▒█ █▒█▀                  ]],
      [[                     ▀█ █▒█ ▄▄▄▄▄ █▒█ █▀                    ]],
      [[                        ▀▒▌▐█▒▒▒█▌▐▒▀                       ]],
      [[                           ▒█▒▒▒█▒                          ]],
      [[                                                            ]],
    },
    {
      [[                                                            ]],
      [[                                                   ▄▄ ▄▄    ]],
      [[                                                  █▒▒▀▒▒█   ]],
      [[                       ███████████████             ▀▄▒▄▀    ]],
      [[                    ███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██             ▀      ]],
      [[                  ███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                  ]],
      [[                 ██▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ▓                 ]],
      [[               ██▒▒▒▒▒▒▒   ▒▓▓▒▒▒▒▒▒   ▒▓▓                  ]],
      [[               ██▒▒▒▒░▒▒▒▒    ▒▒▒▒▒▒▒▒    ▒██               ]],
      [[              ██▒▒▒▒░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒██              ]],
      [[              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██              ]],
      [[               ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒██               ]],
      [[                ███  ██▒▒██  ██▒▒██  ██▒▒██                 ]],
      [[             ███       ███       ███       ███              ]],
      [[                                                            ]],
    },
    {
      [[                                                            ]],
      [[                                                            ]],
      [[                                                            ]],
      [[  ███▄    ██  ▓█████   ▒█████    ██▒    █▓  ██▓  ███▄ ▄███▓ ]],
      [[ ▓██ ▀█   █   ▓█   ▀  ▒██▒  ██▒ ▓██░   ██▒ ▓██▒ ▓██▒▀█▀ ██▒▒]],
      [[ ▓██  ▀█ ██▒ ▒▒███    ▒██░  ██▒  ▓██  ██▒░ ▒██▒ ▓██    ▓██░░]],
      [[ ▓██▒  ▐▌██▒ ▒▒▓█  ▄  ▒██   ██░   ▒██ ██░░ ░██░ ▒██    ▒██  ]],
      [[▒▒██░   ▓███ ░░▒████ ▒░ ████▓▒░    ▒▀█░░   ░██░ ▒██▒   ░██▒ ]],
      [[░░ ▒░   ▒ ▒▒  ░░ ▒░  ░░ ▒░▒░▒░     ░ ▐░░   ░▓   ░ ▒░   ░  ░ ]],
      [[ ░ ░░   ░ ▒▒ ░ ░ ░   ░  ░ ▒ ▒░     ░ ░ ░    ▒ ░ ░  ░      ░ ]],
      [[    ░   ░ ░░     ░    ░ ░ ░ ▒        ░░     ▒ ░ ░      ░    ]],
      [[          ░░     ░   ░    ░ ░         ░     ░          ░    ]],
      [[                                     ░                      ]],
      [[                                                            ]],
      [[                                                            ]],
    },
  }
  return headers[math.random(1, #headers)]
end

return M
