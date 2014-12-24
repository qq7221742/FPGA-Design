module main_system(clock, detect_pin)

    input clock, detect_pin;

    output red, amber, green;

    reg mode;



    traffic_lights traffic(clock, mode, red, amber, green);

    infrared_ray infrared(detect_pin, mode);

endmodule
