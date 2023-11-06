fun flag(land):
  if land == "Norge":white-rectangle = rectangle(22 * 15, 16 * 15, "solid", "white")
red-left-rectangle = square(6 * 15, "solid", "crimson")
red-right-rectangle = rectangle(12 * 15, 6 * 15, "solid", "crimson")
blue-vertical = rectangle(2 * 15, 16 * 15, "solid", "navy")
blue-horizontal = rectangle(22 * 15, 2 * 15, "solid", "navy")

top-left = overlay-align("left", "top", red-left-rectangle, white-rectangle)
bottom-left = overlay-align("left", "bottom", red-left-rectangle,(top-left))
top-right = overlay-align("right", "top", red-right-rectangle,(bottom-left))
bottom-right = overlay-align("right", "bottom", red-right-rectangle, (top-right))
verical-line = overlay-xy(blue-vertical, -106,0,(bottom-right))
    Norge = overlay-xy(blue-horizontal,0,-106,(verical-line))
    Norge

  else if land == "Finland":FI-White = rectangle(360, 220, "solid", "white")
FI-Blue1 = rectangle(360, 60, "solid", "darkblue")
FI-Blue2 = rectangle(60, 220, "solid", "darkblue")

Finland=
  put-image(FI-Blue1, 180, 110,
    put-image(FI-Blue2, 140, 110,
      FI-White))

Finland

  else if land == "Danmark":DA-Red = rectangle(333, 252, "solid", "red")
DA-White1 = rectangle(333, 36, "solid", "white")
DA-White2 = rectangle(36, 252, "solid", "white")

Danmark=
  put-image(DA-White1, 166.5, 110,
    put-image(DA-White2, 126, 126,
      DA-Red))
Danmark


  else if land == "Sverige":SV-Blue = rectangle(353, 220, "solid", "steel blue")
SV-Gold1 = rectangle(353, 36, "solid", "gold")
SV-Gold2 = rectangle(36, 252, "solid", "gold")

Sverige=
  put-image(SV-Gold1, 176.5, 110,
    put-image(SV-Gold2, 126, 126,
      SV-Blue))
Sverige

  else if land == "Island":IS-Blue = rectangle(350, 252, "solid", "navy")
IS-White1 = rectangle(350, 56, "solid", "white")
IS-White2 = rectangle(56, 252, "solid", "white")
IS-Red1 = rectangle(28, 252, "solid", "red")
IS-Red2 = rectangle(350, 28, "solid", "red")

Island=
  put-image(IS-Red1, 126, 126,
    put-image(IS-Red2, 175, 126,
      put-image(IS-White1, 176, 126,
        put-image(IS-White2, 126, 126,
          IS-Blue))))

Island

  else if land == "farayene":FO-white = rectangle(360, 270, "solid", "white")
FO-blue1 = rectangle(360, 60, "solid", "blue")
FO-blue2 = rectangle(60, 270, "solid", "blue")
FO-Red1 = rectangle(30, 270, "solid", "red")
FO-Red2 = rectangle(360, 30, "solid", "red")

farayene=
  put-image(FO-Red1, 135, 135,
    put-image(FO-Red2, 180, 135,
      put-image(FO-blue1, 180, 135,
        put-image(FO-blue2, 135, 135,
          FO-white))))
farayene
  else: "Error"
  end 
end 

#Her har alle flaggene blitt laget ferdig og kan bli laget ved en funksjon. for å få opp ønsket flagg må brukeren skrive flag("land").
Har definert og har studert dimensjonene til de ulike flaggene, og har lagt til else: "error" hvis brukeren skulle ha skrevet et flagg som ikke er tilgjengelig. 