module complex(clk,a0,a1,b0,b1,im,re);
parameter N = 8;
input clk;
input [N-1:0] a0,a1,b0,b1;
output reg [15:0] im, re;
wire [15:0] im1, re1;

wire [15:0] q0, q1, q2, q3;
    
vedic_8x8 V1(a0,b0,q0);
vedic_8x8 V2(a1,b1,q1);
vedic_8x8 V3(a0,b1,q2);
vedic_8x8 V4(a1,b0,q3);

sub_16_bit A1(q0,q1,re1);
add_16_bit A2(q2,q3,im1);
always @(posedge clk) begin
    re = re1;
    im = im1;    
end

endmodule




