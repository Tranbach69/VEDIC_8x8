module sub_16_bit(input1,input2,answer);
parameter N=16;
input [N-1:0] input1,input2;
   output [N-1:0] answer;
   wire  carry_out;
   wire M;
   wire [N-1:0] temp;
  wire [N-1:0] carry;
   assign M = 1;
   genvar i;
   for(i=0; i<N; i=i+1)
   begin
       assign temp[i] = input2[i]^M; 
   end
   generate 
   for(i=0;i<N;i=i+1)
     begin: generate_N_bit_Adder
   if(i==0) 
        full_adder f(input1[0],temp[0],M,answer[0],carry[0]);
   else
        full_adder f(input1[i],temp[i],carry[i-1],answer[i],carry[i]);
     end
  assign carry_out = carry[N-1];
   endgenerate
endmodule 