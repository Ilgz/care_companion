import 'package:cash_manager/application/milestone/milestone_watcher/milestone_watcher_cubit.dart';
import 'package:cash_manager/domain/milestone/milestone.dart';
import 'package:cash_manager/presentation/core/widgets/critical_failure_card.dart';
import 'package:cash_manager/presentation/core/widgets/custom_progress_indicator.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:cash_manager/presentation/milestone/widgets/milestone_card.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MilestoneOverviewPage extends StatefulWidget {
  MilestoneOverviewPage({Key? key}) : super(key: key);

  @override
  State<MilestoneOverviewPage> createState() => _MilestoneOverviewPageState();
}

class _MilestoneOverviewPageState extends State<MilestoneOverviewPage> {
  String selectedValue=Milestone.ageRangeDivisions.first;
  bool dropdownIsOpened=false;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Milestones",
      body: Column(
        children: [
          Container(
            height: 40.0,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xfffd894f).withOpacity(0.2))
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  value: selectedValue,
                  customButton: Align(alignment:Alignment.centerLeft,child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child:  Row(
                      children: [
                        Text(
                          selectedValue,
                          style: TextStyle(fontSize: 16, color: Color(0xfffd894f)),
                        ),
                        Spacer(),

                        Icon(dropdownIsOpened?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,color:Color(0xfffd894f) ,)
                      ],
                    ),
                  )),
                  onMenuStateChange: (isOpened){
                    setState(() {
                      dropdownIsOpened=isOpened;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    height: 40,
                    width: 120,
                    padding: EdgeInsets.only(left: 16),

                  ),
                  dropdownStyleData: DropdownStyleData(
                    openInterval: Interval(0, 1, curve: Curves.easeInOut),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    elevation: 8,
                      ),
                  menuItemStyleData:  MenuItemStyleData(                       padding: EdgeInsets.all(0),
                      customHeights: _getCustomItemsHeights(),
                  ),
                  items: (){
                    final divisions=Milestone.ageRangeDivisions;
                    List<DropdownMenuItem<String>> _menuItems = [];
                    for(int i=0;i<divisions.length;i++){
                      _menuItems.add(DropdownMenuItem(value: divisions[i],
                        child: Container(padding:EdgeInsets.only(left: 16),alignment:Alignment.centerLeft,width:double.infinity,height:double.infinity,color: divisions[i]==selectedValue?Color(0xfffd894f).withOpacity(0.2):Colors.white,child: Text(divisions[i])),
                      ));
                      if (divisions[i] != divisions.last){
                        _menuItems.add(DropdownMenuItem<String>(
                          enabled: false,
                          child: Divider(),
                        ));
                      }
                    }
                    return _menuItems;
                  }(),
                  onChanged: (value) {
                    if(value!=null){
                      setState(() {
                        selectedValue=value;
                      });
                    }

                  },
                ) // your Dropdown Widget here
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: BlocBuilder<MilestoneWatcherCubit, MilestoneWatcherState>(
              builder: (context, state) {
                return state.map(
                    initial: (_) => const SizedBox(),
                    loadInProgress: (_) => CustomProgressIndicator(),
                    loadSuccess: (state) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.milestones.length,
                          itemBuilder: (context, index) {
                            final milestone = state.milestones[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: MilestoneCard(
                                milestone: milestone,
                              ),
                            );
                          });
                    },
                    loadFailure: (_) => CriticalFailureCard());
              },
            ),
          )
        ],
      ),
    );
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (Milestone.ageRangeDivisions.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }
}
