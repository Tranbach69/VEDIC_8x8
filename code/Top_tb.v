module complex_tb();

parameter N = 8 ;
reg Clk;
reg [N-1:0] A0,A1,B0,B1;
wire [15:0] Im,Re;

complex COM(.clk(Clk), .a0(A0), .a1(A1), .b0(B0), .b1(B1), .im(Im), .re(Re));

initial
begin
    Clk = 0; forever #5 Clk = ~Clk;
end
initial 
begin
    A0 = 8'b00010001;
    A1 = 8'b00001101;
    B0 = 8'b00011011;
    B1 = 8'b00000111;
    #20 A1 = 8'b00000011;
    #15 B1 = 8'b00001110;     
end

endmodule

