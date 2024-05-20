require("dashboard").setup {
  theme = "doom",
  config = {
    header = {
      "",
      "YYYYYYY       YYYYYYY                                          iiii                          ",
      "Y:::::Y       Y:::::Y                                         i::::i                         ",
      "Y:::::Y       Y:::::Y                                          iiii                          ",
      "Y::::::Y     Y::::::Y                                                                        ",
      "YYY:::::Y   Y:::::YYYnnnn  nnnnnnnn vvvvvvv           vvvvvvviiiiiii    mmmmmmm    mmmmmmm   ",
      "  Y:::::Y Y:::::Y   n:::nn::::::::nnv:::::v         v:::::v i:::::i  mm:::::::m  m:::::::mm ",
      "   Y:::::Y:::::Y    n::::::::::::::nnv:::::v       v:::::v   i::::i m::::::::::mm::::::::::m",
      "    Y:::::::::Y     nn:::::::::::::::nv:::::v     v:::::v    i::::i m::::::::::::::::::::::m",
      "     Y:::::::Y        n:::::nnnn:::::n v:::::v   v:::::v     i::::i m:::::mmm::::::mmm:::::m",
      "      Y:::::Y         n::::n    n::::n  v:::::v v:::::v      i::::i m::::m   m::::m   m::::m",
      "      Y:::::Y         n::::n    n::::n   v:::::v:::::v       i::::i m::::m   m::::m   m::::m",
      "      Y:::::Y         n::::n    n::::n    v:::::::::v        i::::i m::::m   m::::m   m::::m",
      "      Y:::::Y         n::::n    n::::n     v:::::::v        i::::::im::::m   m::::m   m::::m",
      "   YYYY:::::YYYY      n::::n    n::::n      v:::::v         i::::::im::::m   m::::m   m::::m",
      "   Y:::::::::::Y      n::::n    n::::n       v:::v          i::::::im::::m   m::::m   m::::m",
      "   YYYYYYYYYYYYY      nnnnnn    nnnnnn        vvv           iiiiiiiimmmmmm   mmmmmm   mmmmmm",
      "",
      "",
      "",
      "",
      "",
      "",
    },
    center = {
      {
        icon = " ",
        icon_hl = "Title",
        desc = "New File",
        desc_hl = "String",
        key = "n",
        key_hl = "Number",
        action = "enew"
      },
      {
        icon = " ",
        icon_hl = "Title",
        desc = "Find Recent File",
        desc_hl = "String",
        key = "f",
        key_hl = "Number",
        action = "Telescope oldfiles"
      },
      {
        icon = " ",
        icon_hl = "Title",
        desc = "File Explorer",
        desc_hl = "String",
        key = "e",
        key_hl = "Number",
        action = "NvimTreeOpen"
      },
      {
        icon = " ",
        icon_hl = "Title",
        desc = "Update Plugins",
        desc_hl = "String",
        key = "u",
        key_hl = "Number",
        action = "Lazy sync"
      },
      {
        icon = "󰿅 ",
        icon_hl = "Title",
        desc = "Exit",
        desc_hl = "String",
        key = "q",
        key_hl = "Number",
        action = "q"
      }
    }
  },
}
