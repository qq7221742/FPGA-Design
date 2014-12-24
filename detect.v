module infrared_ray(detect_pin, mode)

    input detect_pin;
    output mode;

    reg [9:0]count, [9:0]start, [9:0]over, [9:0]delta;


    alwasys@(posedge detect_pin)
        begin

            count = count + 1;

        end

    alwasys
        begin

            start = count;

            # 2000 over = count;

            delta = over - start;
            if (delta < 7)
                mode = 0;
            if (delta >= 7)
                mode = 1;
        end

endmodule
