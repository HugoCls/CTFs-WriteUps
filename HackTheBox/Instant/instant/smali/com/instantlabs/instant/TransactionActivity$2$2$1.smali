.class Lcom/instantlabs/instant/TransactionActivity$2$2$1;
.super Ljava/lang/Object;
.source "TransactionActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/TransactionActivity$2$2;->onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/instantlabs/instant/TransactionActivity$2$2;


# direct methods
.method constructor <init>(Lcom/instantlabs/instant/TransactionActivity$2$2;)V
    .locals 0

    iput-object p1, p0, Lcom/instantlabs/instant/TransactionActivity$2$2$1;->this$2:Lcom/instantlabs/instant/TransactionActivity$2$2;

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/instantlabs/instant/TransactionActivity$2$2$1;->this$2:Lcom/instantlabs/instant/TransactionActivity$2$2;

    .line 117
    iget-object v0, v0, Lcom/instantlabs/instant/TransactionActivity$2$2;->this$1:Lcom/instantlabs/instant/TransactionActivity$2;

    iget-object v0, v0, Lcom/instantlabs/instant/TransactionActivity$2;->this$0:Lcom/instantlabs/instant/TransactionActivity;

    const-string v1, "Pin Is Incorrect!"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
