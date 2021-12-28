`timescale 1ns/1ps
`define p 12
module tb_Top_FFT;

reg nrst,clk;


reg [15:0] input_re[191:0];
reg [15:0] input_im[191:0];

reg [15:0] output_re[191:0];
reg [15:0] output_im[191:0];

wire [15:0] inReal,inImag;
wire [15:0] outReal,outImag;

integer clkcnt;

reg start;


Top_FFT top0(.nrst(nrst),.clk(clk),.start(start),.valid(1'b1),.inReal(inReal),.inImag(inImag),.outReal(outReal),.outImag(outImag));

always
  #(`p/2)  clk = !clk;
 
always@(negedge clk)
  clkcnt = clkcnt +1;

initial begin
  clk  = 0;
  nrst = 0;
  clkcnt=-103;
  start = 0;
  $readmemb("binary_in_real.txt", input_re);
  $readmemb("binary_in_imag.txt", input_im);

  #(100*`p) start = 1'b1; 
  #(`p/2+1) nrst = 1;
end

assign inReal = clkcnt > -2? input_re[clkcnt+1] : 0;
assign inImag = clkcnt > -2? input_im[clkcnt+1] : 0;

always @ (posedge clk) begin
output_re[clkcnt+1] <= outReal;
output_im[clkcnt+1] <= outImag;
end


integer dumpfile, i;
initial begin


  #(292*`p +1) dumpfile = $fopen("binary_out_real.txt","w");
  for(i = 0; i<192;i=i+1)begin
  $fwrite(dumpfile,"%b\n",output_re[i]);
  end
  $fclose(dumpfile);
  
    dumpfile = $fopen("binary_out_imag.txt","w");
    for(i = 0; i<192;i=i+1)begin
    $fwrite(dumpfile,"%b\n",output_im[i]);
    end
    $fclose(dumpfile);

  $stop;
end


endmodule
