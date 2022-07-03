import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../hotel_detail/hotel_detail_widget.dart';
import '../reviews_list/reviews_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelsListWidget extends StatefulWidget {
  const HotelsListWidget({Key key}) : super(key: key);

  @override
  _HotelsListWidgetState createState() => _HotelsListWidgetState();
}

class _HotelsListWidgetState extends State<HotelsListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Hotels',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<HotelsRecord>>(
                stream: queryHotelsRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<HotelsRecord> listViewHotelsRecordList = snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewHotelsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewHotelsRecord =
                          listViewHotelsRecordList[listViewIndex];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReviewsListWidget(
                                    hotelDocRef: listViewHotelsRecord.reference,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              listViewHotelsRecord.rating.toString(),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HotelDetailWidget(
                                    hotelDocRef: listViewHotelsRecord.reference,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              listViewHotelsRecord.name,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Text(
                            listViewHotelsRecord.city,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.attach_money,
                              color: Color(0xFFEB0D0D),
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
