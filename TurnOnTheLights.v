module traffic_lights(clock, mode, red, amber, green);

    input clock, mode;
    output red, amber, green;

    parameter on = 1, off = 0, red_tics = 350, amber_tics = 30, green_tics = 200;


    // initial the light color

    initial red = off;
    initial amber = off;
    initial green = off;

    // change the light frequency from the mode

    if mode == 0:
        begin
            red_tics = 350;
            amber_tics = 30;
            green_tics = 350;
        end

    if mode == 1:
        begin
            red_tics = 200;
            amber_tics = 30;
            green_tics = 200;
        end


    alwasys
        begin

            red = on;
            light(red, red_tics);

            geen = on;
            light(green, green_tics);

            amber = on;
            light(amber, amber_tics);

        end



    task light;

        output color;
        input[31:0] tics;

        begin

            repeat(tics - 3)
                @(posedge clock);
            color = off;


            repeat(1)
                @(posedge clock);
            color = on;

            repeat(1)
                @(posedge clock);
            color = off;

            repeat(1)
                @(posedge clock);
            color = on;

        end

    endtask


    // 开启时间计数
    alwasys
        begin
            # 100 clock = 0;
            # 100 clock = 1;
        end

endmodule
