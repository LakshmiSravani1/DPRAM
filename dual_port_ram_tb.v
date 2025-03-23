module dpram_tb;

reg clk, wea, web;
reg [3:0] addra, addrb;
reg [7:0] dina, dinb;
wire [7:0] douta, doutb;

dpram dut (.clk(clk), .wea(wea), .web(web), .addra(addra), .addrb(addrb), 
           .dina(dina), .dinb(dinb), .douta(douta), .doutb(doutb));

initial begin
    clk = 0;
    forever #5 clk = ~clk;   // Clock period = 10 units
end

initial begin
    $monitor("Time=%0t, wea=%b, web=%b, addra=%h, addrb=%h, dina=%h, dinb=%h, douta=%h, doutb=%h", 
              $time, wea, web, addra, addrb, dina, dinb, douta, doutb);

    // Reset
    wea = 0; web = 0;
    addra = 0; addrb = 0;
    dina = 0; dinb = 0;

    // Write data to both ports
    #10;
    wea = 1; web = 1;
    addra = 4'd3; addrb = 4'd5;
    dina = 8'hA5; dinb = 8'h5A;

    #10;
    wea = 0; web = 0;  // Stop writing

    // Read back
    #10;
    addra = 4'd3;
    addrb = 4'd5;

    #20;
    $finish;
end
endmodule
