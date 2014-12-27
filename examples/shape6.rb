#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

#######################################################################
#
# A simple example of how to use the WriteXLSX gem to
# add shapes (objects and right/left connectors) to an Excel xlsx file.
#
# reverse('c'), May 2012, John McNamara, jmcnamara@cpan.org
# converted to Ruby by Hideo NAKAMURA, cxn03651@msj.biglobe.ne.jp
#

require 'write_xlsx'

workbook  = WriteXLSX.new('shape6.xlsx')
worksheet = workbook.add_worksheet

s1 = workbook.add_shape(
      :type   => 'chevron',
      :width  => 60,
      :height => 60
                        )
worksheet.insert_shape('A1', s1, 50, 50)

s2 = workbook.add_shape(
      :type   => 'pentagon',
      :width  => 20,
      :height => 20
                        )
worksheet.insert_shape('A1', s2, 250, 200)

# Create a connector to link the two shapes.
cxn_shape = workbook.add_shape(:type => 'curvedConnector3')

# Link the start of the connector to the right side.
cxn_shape.start       = s1.id
cxn_shape.start_index = 2  # 2nd connection pt, clockwise from top(0).
cxn_shape.start_side  = 'r' # r)ight or b)ottom.

# Link the end of the connector to the left side.
cxn_shape.end         = s2.id
cxn_shape.end_index   = 4  # 4th connection pt, clockwise from top(0).
cxn_shape.end_side    = 'l' # l)eft or t)op.

worksheet.insert_shape('A1', cxn_shape, 0, 0)

workbook.close
