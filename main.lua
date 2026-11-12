function initUi()
    app.registerUi({
        ["menu"] = "Pen tool",
        ["callback"] = "pen",
        ["accelerator"] = "f"
    });
    app.registerUi({
        ["menu"] = "Eraser tool",
        ["callback"] = "eraser",
        ["accelerator"] = "e"
    });
    app.registerUi({
        ["menu"] = "Text tool",
        ["callback"] = "text",
        ["accelerator"] = "t"
    });
    app.registerUi({
        ["menu"] = "Rectangular Select tool",
        ["callback"] = "rect_sel",
        ["accelerator"] = "r"
    });
    app.registerUi({
        ["menu"] = "\"Squiggly\" Select tool",
        ["callback"] = "squig_sel",
        ["accelerator"] = "s"
    });
    app.registerUi({
        ["menu"] = "Highlighter tool",
        ["callback"] = "highlighter",
        ["accelerator"] = "v"
    });
    app.registerUi({
        ["menu"] = "LaTex tool",
        ["callback"] = "latex",
        ["accelerator"] = "x"
    });
    app.registerUi({
        ["menu"] = "Dashed pen tool",
        ["callback"] = "pen_dashed",
        ["accelerator"] = "d"
    });
    app.registerUi({
        ["menu"] = "Hand tool",
        ["callback"] = "hand",
        ["accelerator"] = "c"
    });

    -- Thickness / Sizes
    app.registerUi({
        ["menu"] = "Fine size",
        ["callback"] = "size_fine",
        ["accelerator"] = "q"
    });
    app.registerUi({
        ["menu"] = "Medium size",
        ["callback"] = "size_medium",
        ["accelerator"] = "w"
    });
    app.registerUi({
        ["menu"] = "Thick size",
        ["callback"] = "size_thick",
        ["accelerator"] = "g"
    });

    -- Colors
    app.registerUi({
        ["menu"] = "Color: Black",
        ["callback"] = "color_black",
        ["accelerator"] = "1"
    });
    app.registerUi({
        ["menu"] = "Color: Blue",
        ["callback"] = "color_blue",
        ["accelerator"] = "2"
    });
    app.registerUi({
        ["menu"] = "Color: Red",
        ["callback"] = "color_red",
        ["accelerator"] = "3"
    });
    app.registerUi({
        ["menu"] = "Color: Green",
        ["callback"] = "color_green",
        ["accelerator"] = "4"
    });

    -- Page navigation
    app.registerUi({
        ["menu"] = "Previous Page",
        ["callback"] = "page_prev",
        ["accelerator"] = "b"
    });
    app.registerUi({
        ["menu"] = "Next Page",
        ["callback"] = "page_next",
        ["accelerator"] = "n"
    });
end

function pen()
    app.uiAction({ ["action"] = "ACTION_TOOL_PEN" })
    app.uiAction({ ["action"] = "ACTION_TOOL_LINE_STYLE_PLAIN" })

end

function eraser()
    app.uiAction({ ["action"] = "ACTION_TOOL_ERASER" })
end

function text()
    app.uiAction({ ["action"] = "ACTION_TOOL_TEXT" })
end

function rect_sel()
    app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_RECT" })
end

function squig_sel()
    app.uiAction({ ["action"] = "ACTION_TOOL_SELECT_REGION" })
end

function highlighter()
    app.uiAction({ ["action"] = "ACTION_TOOL_HIGHLIGHTER" })
end

function latex()
    app.uiAction({ ["action"] = "ACTION_TEX" })
end

function hand()
    app.uiAction({ ["action"] = "ACTION_TOOL_HAND" })
end

function pen_dashed()
    app.uiAction({ ["action"] = "ACTION_TOOL_PEN" })
    app.uiAction({ ["action"] = "ACTION_TOOL_LINE_STYLE_DASH" })
end

-- Thickness / Sizes
function size_fine()
    app.uiAction({ ["action"] = "ACTION_SIZE_FINE" })
end

function size_medium()
    app.uiAction({ ["action"] = "ACTION_SIZE_MEDIUM" })
end

function size_thick()
    app.uiAction({ ["action"] = "ACTION_SIZE_THICK" })
end

-- Colors
function color_black()
    app.changeToolColor({ ["color"] = 0x000000, ["selection"] = false })
end

function color_blue()
    app.changeToolColor({ ["color"] = 0x3333cc, ["selection"] = false })
end

function color_red()
    app.changeToolColor({ ["color"] = 0xff0000, ["selection"] = false })
end

function color_green()
    app.changeToolColor({ ["color"] = 0x008000, ["selection"] = false })
end

-- Page navigation
function page_prev()
    app.uiAction({ ["action"] = "ACTION_GOTO_BACK" })
end

function page_next()
    app.uiAction({ ["action"] = "ACTION_GOTO_NEXT" })
end
