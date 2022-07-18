import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  RefreshController refreshController = RefreshController();
  List<TableRow> list = [];

  /// table列表
  Widget tableList() {
    /// tabBox宽度配置
    final Map<int, FixedColumnWidth> tableColumn = {
      0: FixedColumnWidth(100),
      1: FixedColumnWidth(100),
      2: FixedColumnWidth(100),
      3: FixedColumnWidth(100),
      4: FixedColumnWidth(100),
      5: FixedColumnWidth(150),
    };

    /// 单个tabBox
    Widget tabBox(String text, {double? size, Color? color}) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: color, fontSize: size),
        ),
      );
    }

    ///table 头部
    // Table tableHeader() {
    //   return Table(
    //     columnWidths: tableColumn,
    //     border: TableBorder.all(
    //       color: Colors.grey,
    //       width: 1,
    //     ),
    //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    //     children: [
    //       TableRow(children: [
    //         tabBox('二维码', size: 14),
    //         tabBox('机种名', size: 14, color: Colors.red),
    //         tabBox('夹位', size: 14, color: Colors.red),
    //         tabBox('T号', size: 14, color: Colors.red),
    //         tabBox('料号', size: 14),
    //         tabBox('操作', size: 14),
    //       ])
    //     ],
    //   );
    // }

    ///table 内容
    Table tableBody() {
      return Table(
        columnWidths: tableColumn,
        border: TableBorder.all(color: Colors.yellow, width: 1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(children: [
            tabBox('二维码', size: 14),
            tabBox('机种名', size: 14, color: Colors.red),
            tabBox('夹位', size: 14, color: Colors.red),
            tabBox('T号', size: 14, color: Colors.red),
            tabBox('料号', size: 14),
            tabBox('操作', size: 14),
          ]),
          ...list
        ],
      );
    }

    return Column(
      children: [
        /// 固定头部
        // tableHeader(),
        Container(
          height: 300,
          color: Colors.yellow,
        ),
        // 内容区域
        Expanded(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: ClassicHeader(),
            footer: ClassicFooter(),
            onLoading: () {
              print(list.length);
              Future<void>.delayed(Duration(milliseconds: 2000), () {
                for (int i = 0; i < 2; i++) {
                  String item = i.toString();
                  list.add(
                    TableRow(
                      children: [
                        tabBox(
                          '$item',
                          size: 12,
                          color: Colors.grey,
                        ),
                        tabBox(
                          item,
                          size: 12,
                          color: Colors.grey,
                        ),
                        tabBox(
                          item,
                          size: 12,
                          color: Colors.grey,
                        ),
                        tabBox(
                          item,
                          size: 12,
                          color: Colors.grey,
                        ),
                        tabBox(
                          '${item}',
                          size: 12,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '选取',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
                refreshController.loadComplete();
                setState(() => null);
              });
            },
            onRefresh: () {
              Future<void>.delayed(Duration(milliseconds: 2000), () {
                setState(() {
                  list = [];
                });
                refreshController.refreshCompleted();
              });
            },
            controller: refreshController,
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                child: tableBody(),
                scrollDirection: Axis.horizontal,
                // physics: BouncingScrollPhysics(),
              ),
              // physics: BouncingScrollPhysics(),
            ),
          ),
        ),
      ],
    );
  }

  ///订单单行信息
  Widget rowItem({required String key, required String value}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 1,
        color: Colors.green,
      ))),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(
                key,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('table表格加载'),
      ),
      body: tableList(),
    );
  }
}
