# XTableViewAutoLayoutHeader-Footer
让表格视图UITableView的TableHeader和TableFooter可以使用AutoLayout进行布局

一直以来Autolayout只能是 被addSubView 以后有了SuperView 才能写约束，但是UITableView得 tableHeaderView 和 tableFooterView 全都是 直接赋值的,我猜测是 Apple重写了 setter方法吧 具体实现不做追究。


为了能够使用 Autolayout 我想到的办法就是 在tableHeaderView的基础上再add一个透明的view 用这个view进行布局，得到布局的尺寸以后反向更改SuperView的尺寸。

使用方法:将UIView控件添加到contentView上

