#include <QtTest>

#include "core/EventBus.h"
#include "dialogue/DialogueManager.h"
#include "pet/rendering/SpriteAnimationController.h"

class ProgrammerPetTests : public QObject
{
    Q_OBJECT

private slots:
    void busPublishes()
    {
        EventBus bus;
        QSignalSpy spy(&bus, &EventBus::eventPublished);
        bus.publish({PetEventType::HighCpu});
        QCOMPARE(spy.count(), 1);
    }

    void buildFailure17()
    {
        DialogueManager dialogue;
        QCOMPARE(dialogue.forEvent("build_failed", 17),
                 QString::fromUtf8(u8"第17次编译失败，我已经习惯了。"));
    }

    void spriteStateMapping()
    {
        SpriteAnimationController sprite;
        sprite.setPetState("Idle"); QCOMPARE(sprite.animation(), QStringLiteral("idle"));
        sprite.setPetState("Walking"); QCOMPARE(sprite.animation(), QStringLiteral("walk"));
        sprite.setPetState("Jumping"); QCOMPARE(sprite.animation(), QStringLiteral("jump"));
        sprite.setPetState("Perching"); QCOMPARE(sprite.animation(), QStringLiteral("sit"));
        sprite.setPetState("Celebrating"); QCOMPARE(sprite.animation(), QStringLiteral("celebrate"));
        sprite.setPetState("Dead"); QCOMPARE(sprite.animation(), QStringLiteral("dead"));
        sprite.setPetState("WindowDragging"); QCOMPARE(sprite.animation(), QStringLiteral("walk"));
        sprite.setAnimation("not-real"); QCOMPARE(sprite.animation(), QStringLiteral("idle"));
    }

    void spriteDefinitions()
    {
        SpriteAnimationController sprite;
        sprite.setAnimation("jump"); QCOMPARE(sprite.looping(), false); QCOMPARE(sprite.frameCount(), 12);
        sprite.setAnimation("walk"); QCOMPARE(sprite.looping(), true); QCOMPARE(sprite.frameCount(), 12);
        sprite.setAnimation("sit"); QCOMPARE(sprite.looping(), true); QCOMPARE(sprite.frameCount(), 8);
    }
};

QTEST_APPLESS_MAIN(ProgrammerPetTests)
#include "EventBusTest.moc"
