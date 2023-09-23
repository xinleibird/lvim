local M = {}

M.dashboard = function()
  math.randomseed(os.time())
  local headers = {
    {
      [[                                                            ]],
      [[                         ██████████                         ]],
      [[                     ████░░░░░░░░░░████                     ]],
      [[                 ████░░░░░░░░░░░░░░░░░░████                 ]],
      [[               ██░░░░░░░░░░░░░░░░░░░░    ░░██               ]],
      [[             ██░░░░░░░░░░░░░░░░░░░░░░░░    ░░██             ]],
      [[             ██░░░░░░░░██░░░░░░░░░░██░░░░░░░░██             ]],
      [[           ██░░░░░░░░░░██░░░░░░░░░░██░░░░░░░░░░██           ]],
      [[           ██░░░░▒▒▒▒░░░░░░░░░░░░░░░░░░▒▒▒▒░░░░██           ]],
      [[           ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██           ]],
      [[             ██░░░░░░░░██░░░░░░░░░░██░░░░░░░░██             ]],
      [[               ████████  ██████████  ████████               ]],
      [[             ██   ██         ██         ██   ██             ]],
      [[                                                            ]],
      [[                                                            ]],
    },
    {
      [[                                                            ]],
      [[                          █████████                         ]],
      [[                      ████▒▒▒▒▒▒▒▒▒████                     ]],
      [[                    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                   ]],
      [[                  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                 ]],
      [[                 █▒▒▒▒▒█▒▒    ▒▒▒▒▒▒▒▒▒    █                ]],
      [[                ██▒▒▒▒▒▒  ▒▒▓▓  ▒▒▒▒▒  ▒▒▓▓ █               ]],
      [[                █▒▒▒▒▒▒▒  ▒▒▓▓  ▒▒▒▒▒  ▒▒▓▓ █               ]],
      [[                █▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒▒    █                ]],
      [[               █▒▒▒▒▒▒▒▒█▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒█               ]],
      [[              █▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█              ]],
      [[             █▒▒▒▒████▒▒▒▒▒▒████▒▒▒▒▒▒████▒▒▒▒█             ]],
      [[            ██▒▒██    ██▒▒██    ██▒▒██    ██▒▒██            ]],
      [[              ██        ██        ██        ██              ]],
      [[                                                            ]],
    },
    {
      [[                                                            ]],
      [[                                                            ]],
      [[                 ▄▄▄▄▄▒█████████████████▒▄▄▄▄▄              ]],
      [[               ▄▒█████████▀▀▀▀▀▀▀▀▀▀██████▀███▒▄            ]],
      [[             ▄██▀████████▄             ▀▀████ ▀█▒▄          ]],
      [[            ▀▒█▄▄██████████████████▄▄▄         ▄█▒▀         ]],
      [[              ▀▒████████████████████████▄    ▄█▒▀           ]],
      [[                ▀▒███▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄█▒▀             ]],
      [[                  ▀▒██▄              ▀█████▒▀               ]],
      [[                    ▀▒█████▄         ▄███▒▀                 ]],
      [[                       ▀▒████▄▄▄▄▄▄▄██▒▀                    ]],
      [[                         ▀▒███▀▀▀███▒▀                      ]],
      [[                           ▀▒██▄██▒▀                        ]],
      [[                              ▀▒▀                           ]],
      [[                                                            ]],
    },
    {
      [[                                                            ]],
      [[                              ▄▄▄▄ ▄▄▄                      ]],
      [[                           ▄▀▀   ▀▒   █                     ]],
      [[                         ▄▀  ▄██████▄ █                     ]],
      [[                        ▄▒▄█▀  ▄ ▄ ▒▀▀▄                     ]],
      [[                       ▄▀ ▒█▄  ▀ ▀ ▀▄ █                     ]],
      [[                       ▀▄  ▀ ▄█▄▄  ▄█▄▀                     ]],
      [[                         ▀█▄▄  ▀▀▀█▀ █                      ]],
      [[                        ▄▀   ▀██▀▀█▄▀                       ]],
      [[                       ▒  ▄▀▀▀▄█▄  ▀▒                       ]],
      [[                       ▀▄█     █▀▀▄▄▀▒                      ]],
      [[                        ▄▀▀▄▄▄██▄▄█▀  ▒                     ]],
      [[                       ▒▀ ▒███▒███▒   ▒                     ]],
      [[                       ▒  ▒█▀▀▀   ▀▄▄█▀                     ]],
      [[                        ▀▀                                  ]],
    },
    {
      [[                                                            ]],
      [[                                                            ]],
      [[                            ▄▄▒▀▀▄                          ]],
      [[                          ▄▒████▄▄█▄                        ]],
      [[                         ▄▀██████▄▄██                       ]],
      [[                         ▒ ▒▀  ▄▄▀█ ▒                       ]],
      [[                         ▄██   ▀▀ ▀ ▒                       ]],
      [[                      ▄█▀  ▀█ ▀▀▀▀▄▀▀█▄                     ]],
      [[                     ▄▒█▒ ▄  ▀▀▀▀▀▄ ▒█▒▄                    ]],
      [[                     ▒████▒       ▒████▒                    ]],
      [[                     ▀███▀█████████▀███▀                    ]],
      [[                        ▄█▄ ▀▀█▀   █▄                       ]],
      [[                     ▄▄▒████▄▀ ▀▄████▒▄▄                    ]],
      [[                    ▒███████▒   ▒███████▒                   ]],
      [[                                                            ]],
    },
    {
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
