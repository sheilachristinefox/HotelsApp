import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../hotels_list/hotels_list_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewsListWidget extends StatefulWidget {
  const ReviewsListWidget({
    Key key,
    this.hotelDocRef,
  }) : super(key: key);

  final DocumentReference hotelDocRef;

  @override
  _ReviewsListWidgetState createState() => _ReviewsListWidgetState();
}

class _ReviewsListWidgetState extends State<ReviewsListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HotelsListWidget(),
              ),
            );
          },
        ),
        title: StreamBuilder<HotelsRecord>(
          stream: HotelsRecord.getDocument(widget.hotelDocRef),
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
            final textHotelsRecord = snapshot.data;
            return Text(
              'Reviews for ${textHotelsRecord.name}',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            );
          },
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder<List<ReviewsRecord>>(
                stream: queryReviewsRecord(
                  queryBuilder: (reviewsRecord) =>
                      reviewsRecord.where('ref', isEqualTo: widget.hotelDocRef),
                ),
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
                  List<ReviewsRecord> listViewReviewsRecordList = snapshot.data;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewReviewsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewReviewsRecord =
                          listViewReviewsRecordList[listViewIndex];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            listViewReviewsRecord.title,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Text(
                            listViewReviewsRecord.description,
                            style: FlutterFlowTheme.of(context).bodyText1,
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
