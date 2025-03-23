module dpram(douta,doutb,clk,wea,web,addra,addrb,dina,dinb);
input clk,wea,web;
input [3:0]addra,addrb;              //4-bit address
input [7:0]dina,dinb;                //8-bit data input
output reg [7:0]douta,doutb;         //8-bit data output
reg [7:0] mem[15:0];                 //16 locations, each 8-bit wide

always @(posedge clk)
begin
  if(wea)
    mem[addra] <= dina;   //write on port A
  if(web)
    mem[addrb] <= dinb;   //write on port B

  douta <= mem[addra];    //read on port A
  doutb <= mem[addrb];    //read on port B
end
endmodule
