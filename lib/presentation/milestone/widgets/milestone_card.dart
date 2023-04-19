import 'package:cash_manager/application/milestone/milestone_actor/milestone_actor_cubit.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MilestoneCard extends StatelessWidget {
  const MilestoneCard({Key? key, required this.milestone}) : super(key: key);
  final Milestone milestone;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1, // Adjust the elevation value as needed
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xfffd894f).withOpacity(0.2))),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Milestone
                      .milestoneCategories[milestone.category].backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Milestone
                          .milestoneCategories[milestone.category].iconData,
                      size: 16,
                      color: Milestone
                          .milestoneCategories[milestone.category].iconColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      milestone.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(
                      Milestone.ageRangeDivisions[milestone.ageRangeIndex],
                      style: TextStyle(fontSize: 12, color: Colors.orange),
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              highlightColor: Color(0xfffd894f).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    milestone.name,
                                    style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                InkWell(
                                  highlightColor: Color(0xfffd894f).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 50,
                                      height: 50,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Color(0xfffd894f)
                                                  .withOpacity(0.3))),
                                      child: Icon(
                                        Icons.close,
                                        color: Color(0xfffd894f),
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Color(0xfffd894f),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                   CompletionPhaseRadio(radioCompletionPhase: 0, milestone: milestone),
                                Divider(),
                                CompletionPhaseRadio(radioCompletionPhase: 1, milestone: milestone),
                                Divider(),
                                CompletionPhaseRadio(radioCompletionPhase: 2, milestone: milestone),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: Color(0xfffd894f).withOpacity(0.5))),
                child: Row(
                  children: [
                    Text(
                      "Making progress",
                      style: TextStyle(fontSize: 16, color: Color(0xfffd894f)),
                    ),
                    Spacer(),
                    Container(
                        width: 16,
                        height: 16,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border:
                                Border.all(width: 2, color: Color(0xfffd894f))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xfffd894f),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        bottomLeft: Radius.circular(50))),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ))
                    // Container(width:14,height:14,padding:EdgeInsets.symmetric(horizontal: 4,vertical: 2),decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50),border: Border.all(color:Color(0xfffd894f))),child: Center(child: LeftSemicircleFill(color: Colors.yellow, width:4, height:18  )))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CompletionPhaseRadio extends StatelessWidget {
  const CompletionPhaseRadio({Key? key, required this.radioCompletionPhase, required this.milestone}) : super(key: key);
  final int radioCompletionPhase;
  final Milestone milestone;
  static const phases=["Not started","Making progress","Achieved"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(children: [
        SizedBox(width: 8,),
        Text(phases[radioCompletionPhase],style:TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w600)),
        Spacer(),
        Transform.scale(
          scale: 0.8,
          child: Radio<String>(
            activeColor: Color(0xfffd894f),
            value: phases[radioCompletionPhase],
            groupValue: phases[milestone.completionPhaseIndex],
            onChanged: (String? value) {
              if(value!=null){
                print("radiod");
                milestone.completionPhaseIndex=phases.indexWhere((phase) => phase==value,0);
                print(milestone.completionPhaseIndex);
                  context.read<MilestoneActorCubit>().changeCompletionPhase(milestone);
                Navigator.pop(context);
              }
            },
          ),
        ),
      ],),
    );
  }
}

