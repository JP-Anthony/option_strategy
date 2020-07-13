
This is an R Model that creates graphs charting Profit and Loss of two options against the close price. 

This model is discussed in detail in Natenburg's Option Volitality and Pricing, Ch. 4 and is called the Parity Graph, Intrinsic Value Graph or, hockey stick diagram. To build this we make the assumption that both options are on the same security and that they expire at the same time. This model charts the progress of two options; puts or calls and buys or sells. The total PnL of both options is also calculated and graphed as well.

Across the X-axis is the close price of an option. This represents where the market is on the expiry date. On the Y-axis is a graph of the total profit or loss with the break even line at 0.

The blue line represents the first option's profit or loss. The green line represents the second option and the sum of both options is calculated and added to the graph as a Red line. 

So, for example: 

Option 1:
Put: Buy,
Strike: 78,
Premium: 5

Option 2:
Call: Buy,
Strike: 82,
Premium: 8

For option one, if the option expires above the strike price the total profit and loss is the premium. This is the blue line off to the right that is -5 below the break even line. On the left hand side the blue line increases as the value increases below the strike price. 

For option two, if this call expires below the strike price there is a loss of -8 as the green line is below break even. As the price rises the profit of the call increases. 

The red line is the total of both options. Both are out of the money between 78 and 82. If neither is in the money then it's a total loss of -13 shown by the lowest section of the red line. 

The total PnL line increases further out than either the Put or the Call, because either the put or the call needs to increase in value enough to cover the cost of the other option that is out of the money. 

![test](https://github.com/JP-Anthony/option_strategy/blob/master/put785_call828.JPG?raw=true)

Also interesting is the slope. Each individual option has a slope of 1:1, however, their sums alter the total PnL Slope. In the below graph we've purchased two puts. Between 70 and 85 the Total PnL Slope is 1:1 as there is only one option in the money. However, the other option starts to gain value at 70 which increases the slope of the Total PnL giving it a crook upward. 

![test](https://github.com/JP-Anthony/option_strategy/blob/master/twoputs.JPG?raw=true)

There's loads of other strategies and the graphs are fully explained in Natenburg and that's pretty cool. If you are keen to run this the variables to update are the two options, opt1 and opt2:
opt1 <- c(1, 1, 70, 5)
opt2<- c(1, 1, 85, 2)

Plug in the variables you want based on the below in order:
Put 1 /Call -1,
Buy 1 /Sell -1,
Strike #,
Premium #

And that's it. 

