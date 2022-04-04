module SR_FF(s,r,clk,q,qbar);
input s,r,clk;
output reg q, qbar;
always@(posedge clk)
begin
if(s ==1)
begin
q <= 1;
qbar <= 0;
end 
else if(r == 1)
begin
q <= 0;
qbar <=1;
end
else if(s == 0 & r == 0)
begin q <= q;
qbar <= qbar;
end
end 
endmodule 

//test bench


`include "srff.v"
module SR_tb();

reg s,r,clk=0;
wire q,qbar;
always #15 clk=~clk;

srff OUT (.s(s),.r(r),.clk(clk),.q(q),.qbar(qbar));
initial begin

s=0;
r=0;
#10
s=0;
r=1;
#10
s=1;
r=1;
#10;
$display("s=%b r=%b clk=%b q=%b qbar=%b",s,r,clk,q,qbar); 

end 


endmodule
