include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source

ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

#(Kap 8.1.2 Dealing with Missing Entries) For å fylle ut manglende verdier der hvor det «ikke anses som en Verdi», men "0" en gyldig Verdi, må du gjøre følgende forandringer for å gjøre tabellen lesbar for pyret.

kWh-wealthy-consumer-data =
  load-table: komponent, energi
    source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer 
    sanitize komponent using string-sanitizer
end

#Her blir tabellen sanitized.

print(kWh-wealthy-consumer-data)

#Opprettet en funksjon som koverterer strings i kollonen "energi" til tall og vil gi "bil" en verdi "0". (Kap 5.4 Documenting Functiones)
fun energi-to-number(str :: String) -> Number:
  doc: "if str is not a numeric string, default to 0."
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
where:
energi-to-number("") is 0
  energi-to-number("69") is 69
end

#Tabell som overfører data fra type string til type tall.

modified-table = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

print(modified-table)

#funksjonen for å gjøre beregning av bilens energiforbruk i tabellen.(1.1.8 Functiones)
fun car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
(distance-travelled-per-day / 
                            distance-per-unit-of-fuel) * 
                                        energy-per-unit-of-fuel
where:
  car-energi-per-day(18, 6, 7) is 21
end

distance-travelled-per-day = 18
distance-per-unit-of-fuel = 6
energy-per-unit-of-fuel = 7


#Ved å bruke funskjonen sum med car-energi-per-day kan man beregne totalt energiforbruk per dag for en innbygger i et industriland.
total-energi-car = sum(modified-table, "energi") + car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel)

total-energi-car

#Illustrasjon av tabellen
bar-chart(modified-table, "komponent", "energi")

#For å generere korrekt energiforbruk for bil i illustrasjonen brukte jeg energi-to-number funksjonen, (kap 1.1.8 Functions)
fun energi-to-number-with-car(str :: String) -> Number:
   cases(Option) string-to-number(str):
    | some(a) => a
    | none => car-energi-per-day(18, 6, 7)
  end
where:
energi-to-number("") is 0
  energi-to-number("69") is 69
end

#nåværende utgave 
modified-table-with-car = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number-with-car)

print(modified-table-with-car)

#Den nyeste versjonen av illustrasjonen av bilforbruket.
bar-chart(modified-table-with-car, "komponent", "energi")