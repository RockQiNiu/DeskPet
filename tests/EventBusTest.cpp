#include <QtTest>
#include "core/EventBus.h"
#include "dialogue/DialogueManager.h"
class ProgrammerPetTests : public QObject {
    Q_OBJECT
private slots:
    void busPublishes() { EventBus bus; QSignalSpy spy(&bus, &EventBus::eventPublished); bus.publish({PetEventType::HighCpu}); QCOMPARE(spy.count(), 1); }
    void buildFailure17() { DialogueManager d; QCOMPARE(d.forEvent("build_failed", 17), QString("Build failure number 17. I am used to it.")); }
};
QTEST_MAIN(ProgrammerPetTests)
#include "EventBusTest.moc"
