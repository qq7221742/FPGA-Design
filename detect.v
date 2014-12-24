module infrared_ray(detect_pin, mode)

    input detect_pin;
    output mode;

    reg count[9:0], start[9:0], over[9:0], delta[9:0];

    /*// delay for the detection
    parameter delay = 2000;*/



    alwasys@(posedge detect_pin)
        begin

            count = count + 1;



        end

    alwasys
        begin

            start = count;

            # 2000 over = count;

            delta = over - start;
            if delta < 7:
                mode = 0;
            if delta >= 7;
                mode = 1;
        end




endmodule
