.class Lcom/instantlabs/instant/ProfileActivity$1$1;
.super Ljava/lang/Object;
.source "ProfileActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/ProfileActivity$1;->onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/instantlabs/instant/ProfileActivity$1;

.field final synthetic val$e:Ljava/io/IOException;


# direct methods
.method constructor <init>(Lcom/instantlabs/instant/ProfileActivity$1;Ljava/io/IOException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/instantlabs/instant/ProfileActivity$1$1;->this$1:Lcom/instantlabs/instant/ProfileActivity$1;

    iput-object p2, p0, Lcom/instantlabs/instant/ProfileActivity$1$1;->val$e:Ljava/io/IOException;

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/instantlabs/instant/ProfileActivity$1$1;->this$1:Lcom/instantlabs/instant/ProfileActivity$1;

    .line 60
    iget-object v0, v0, Lcom/instantlabs/instant/ProfileActivity$1;->this$0:Lcom/instantlabs/instant/ProfileActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error Occured: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/instantlabs/instant/ProfileActivity$1$1;->val$e:Ljava/io/IOException;

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
