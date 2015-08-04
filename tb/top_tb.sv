import hash_table::*;

module top_tb;

localparam KEY_WIDTH        = 32;
localparam VALUE_WIDTH      = 16;
localparam BUCKET_WIDTH     = 8;
localparam HASH_TYPE        = "dummy";
localparam TABLE_ADDR_WIDTH = 10;

bit clk;
bit rst;

always #5ns clk = !clk;

ht_task_if #( 
  .KEY_WIDTH      ( KEY_WIDTH   ),
  .VALUE_WIDTH    ( VALUE_WIDTH )
) ht_task_in ( 
  .clk            ( clk         )
);

ht_res_if #( 
  .KEY_WIDTH      ( KEY_WIDTH   ),
  .VALUE_WIDTH    ( VALUE_WIDTH )
) ht_res_out ( 
  .clk            ( clk         )
);


initial
  begin
    rst <= 1'b1;

    @( posedge clk );
    @( posedge clk );
    @( negedge rst );
    rst <= 1'b0;
  end



hash_table_top #( 
  .KEY_WIDTH        ( KEY_WIDTH        ), 
  .VALUE_WIDTH      ( VALUE_WIDTH      ),
  .BUCKET_WIDTH     ( BUCKET_WIDTH     ),
  .HASH_TYPE        ( HASH_TYPE        ),
  .TABLE_ADDR_WIDTH ( TABLE_ADDR_WIDTH )
) dut (

  .clk_i                                  ( clk               ),
  .rst_i                                  ( rst               ),
    
  .ht_task_in                             ( ht_task_in        ),
  .ht_res_out                             ( ht_res_out        )

);

endmodule